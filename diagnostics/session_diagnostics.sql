-- ============================================================================
-- Oracle Session Diagnostics for APEX
-- ============================================================================
-- Purpose: Diagnose active session issues, waits, and resource consumption
-- ============================================================================

SET PAGESIZE 1000
SET LINESIZE 250
SET SERVEROUTPUT ON

PROMPT ============================================================================
PROMPT Active Session Diagnostics
PROMPT ============================================================================

PROMPT
PROMPT === 1. Current Active Sessions ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.osuser,
    s.machine,
    s.program,
    s.module,
    s.action,
    s.logon_time,
    s.status,
    ROUND((s.last_call_et)/60, 2) idle_minutes,
    s.sql_id,
    s.blocking_session,
    s.wait_class,
    s.event,
    ROUND(s.seconds_in_wait, 2) wait_seconds
FROM v$session s
WHERE s.username IS NOT NULL
  AND s.type = 'USER'
ORDER BY s.status, s.seconds_in_wait DESC;

PROMPT
PROMPT === 2. Sessions Consuming High PGA ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    s.module,
    ROUND(p.value/1024/1024, 2) pga_used_mb,
    ROUND(p.value/1024/1024, 2) pga_allocated_mb,
    s.sql_id
FROM v$session s,
     v$sesstat p
WHERE s.sid = p.sid
  AND p.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'session pga memory')
  AND s.username IS NOT NULL
  AND p.value > 10485760
ORDER BY p.value DESC;

PROMPT
PROMPT === 3. Sessions with High Temp Space Usage ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.sql_id,
    t.tablespace,
    ROUND(t.blocks * 8192/1024/1024, 2) temp_mb,
    t.segtype
FROM v$session s,
     v$sort_usage t
WHERE s.saddr = t.session_addr
ORDER BY t.blocks DESC;

PROMPT
PROMPT === 4. Long Running Queries ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    ROUND(s.last_call_et/60, 2) runtime_minutes,
    s.sql_id,
    sq.sql_text,
    s.module,
    s.action
FROM v$session s
JOIN v$sql sq ON s.sql_id = sq.sql_id
WHERE s.username IS NOT NULL
  AND s.status = 'ACTIVE'
  AND s.last_call_et > 60
ORDER BY s.last_call_et DESC;

PROMPT
PROMPT === 5. Blocking Session Tree ===
PROMPT

WITH session_tree AS (
    SELECT 
        sid,
        serial#,
        blocking_session,
        username,
        sql_id,
        event,
        seconds_in_wait,
        LEVEL tree_level
    FROM v$session
    WHERE blocking_session IS NOT NULL
       OR sid IN (SELECT blocking_session FROM v$session WHERE blocking_session IS NOT NULL)
    START WITH blocking_session IS NULL
    CONNECT BY PRIOR sid = blocking_session
)
SELECT 
    LPAD(' ', (tree_level-1)*2, ' ') || sid || ',' || serial# blocking_tree,
    username,
    sql_id,
    event,
    seconds_in_wait
FROM session_tree
ORDER BY tree_level, sid;

PROMPT
PROMPT === 6. APEX Sessions Detail ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.osuser,
    s.machine,
    s.module apex_app,
    s.action apex_page,
    s.client_identifier apex_user,
    s.status,
    s.sql_id,
    ROUND(s.last_call_et/60, 2) idle_minutes
FROM v$session s
WHERE s.module LIKE 'APEX:%'
   OR s.program LIKE '%ORDS%'
ORDER BY s.last_call_et DESC;

PROMPT
PROMPT === 7. Top Wait Events by Session ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    e.event,
    e.total_waits,
    ROUND(e.time_waited/100, 2) time_waited_sec,
    ROUND(e.average_wait*10, 2) avg_wait_ms
FROM v$session s
JOIN v$session_event e ON s.sid = e.sid
WHERE s.username IS NOT NULL
  AND e.wait_class != 'Idle'
  AND e.total_waits > 10
ORDER BY e.time_waited DESC
FETCH FIRST 30 ROWS ONLY;

PROMPT
PROMPT === 8. Open Cursors by Session ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    oc.cursor_count,
    p.value max_cursors,
    ROUND((oc.cursor_count/p.value)*100, 2) cursor_usage_pct
FROM v$session s
JOIN (
    SELECT sid, COUNT(*) cursor_count
    FROM v$open_cursor
    GROUP BY sid
) oc ON s.sid = oc.sid
CROSS JOIN (SELECT value FROM v$parameter WHERE name = 'open_cursors') p
WHERE s.username IS NOT NULL
ORDER BY cursor_usage_pct DESC;

PROMPT
PROMPT === 9. Session Statistics - I/O and Logical Reads ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    physical.value physical_reads,
    logical.value logical_reads,
    ROUND(physical.value / NULLIF(logical.value, 0) * 100, 2) physical_read_pct
FROM v$session s
LEFT JOIN v$sesstat physical ON s.sid = physical.sid 
    AND physical.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'physical reads')
LEFT JOIN v$sesstat logical ON s.sid = logical.sid 
    AND logical.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'session logical reads')
WHERE s.username IS NOT NULL
  AND logical.value > 1000
ORDER BY logical.value DESC
FETCH FIRST 20 ROWS ONLY;

PROMPT
PROMPT === 10. Parse Statistics by Session ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    hard_parse.value hard_parses,
    soft_parse.value parse_calls,
    ROUND((hard_parse.value / NULLIF(soft_parse.value, 0)) * 100, 2) hard_parse_pct
FROM v$session s
LEFT JOIN v$sesstat hard_parse ON s.sid = hard_parse.sid 
    AND hard_parse.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'parse count (hard)')
LEFT JOIN v$sesstat soft_parse ON s.sid = soft_parse.sid 
    AND soft_parse.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'parse count (total)')
WHERE s.username IS NOT NULL
  AND soft_parse.value > 100
ORDER BY hard_parse_pct DESC
FETCH FIRST 20 ROWS ONLY;

PROMPT
PROMPT === 11. Enqueue and Lock Waits ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    l.type lock_type,
    DECODE(l.lmode, 
        0, 'None',
        1, 'Null',
        2, 'Row Share',
        3, 'Row Exclusive',
        4, 'Share',
        5, 'Share Row Exclusive',
        6, 'Exclusive') lock_mode,
    DECODE(l.request,
        0, 'None',
        1, 'Null',
        2, 'Row Share',
        3, 'Row Exclusive',
        4, 'Share',
        5, 'Share Row Exclusive',
        6, 'Exclusive') lock_request,
    o.owner || '.' || o.object_name object_name,
    o.object_type
FROM v$session s
JOIN v$lock l ON s.sid = l.sid
LEFT JOIN dba_objects o ON l.id1 = o.object_id
WHERE s.username IS NOT NULL
  AND (l.lmode > 0 OR l.request > 0)
ORDER BY s.sid;

PROMPT
PROMPT === 12. Connection Pool Analysis (ORDS) ===
PROMPT

SELECT 
    machine,
    program,
    COUNT(*) connection_count,
    SUM(CASE WHEN status = 'ACTIVE' THEN 1 ELSE 0 END) active_count,
    SUM(CASE WHEN status = 'INACTIVE' THEN 1 ELSE 0 END) inactive_count,
    ROUND(AVG(last_call_et/60), 2) avg_idle_minutes
FROM v$session
WHERE program LIKE '%ORDS%'
   OR program LIKE '%JDBC%'
GROUP BY machine, program
ORDER BY connection_count DESC;

PROMPT
PROMPT ============================================================================
PROMPT Session Diagnostic Summary
PROMPT ============================================================================
PROMPT
PROMPT Actions to Consider:
PROMPT 1. Kill idle sessions consuming resources (ALTER SYSTEM KILL SESSION)
PROMPT 2. Investigate blocking sessions and resolve locks
PROMPT 3. Review long-running queries for optimization
PROMPT 4. Monitor high PGA consumers for memory issues
PROMPT 5. Analyze high parse rates - consider cursor sharing
PROMPT 6. Check connection pool sizing for ORDS
PROMPT ============================================================================
