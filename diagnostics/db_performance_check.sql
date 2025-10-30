-- ============================================================================
-- Oracle APEX Database Performance Diagnostic Script
-- ============================================================================
-- Purpose: Comprehensive database performance analysis for APEX environments
-- Target: Oracle 23 AI with APEX 23.2
-- ============================================================================

SET PAGESIZE 1000
SET LINESIZE 200
SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

PROMPT ============================================================================
PROMPT Oracle APEX Performance Diagnostic Report
PROMPT Generated: &_DATE
PROMPT ============================================================================

PROMPT
PROMPT === 1. Database Version and Configuration ===
PROMPT

SELECT banner FROM v$version WHERE banner LIKE 'Oracle%';

SELECT 
    name, 
    value, 
    description
FROM v$parameter
WHERE name IN (
    'memory_target',
    'memory_max_target',
    'sga_target',
    'sga_max_size',
    'pga_aggregate_target',
    'pga_aggregate_limit',
    'processes',
    'sessions',
    'open_cursors',
    'db_cache_size',
    'shared_pool_size',
    'result_cache_max_size'
)
ORDER BY name;

PROMPT
PROMPT === 2. APEX Installation Details ===
PROMPT

SELECT 
    version_no "APEX Version",
    api_compatibility "API Compatibility",
    patch_applied "Patches Applied"
FROM apex_release;

PROMPT
PROMPT === 3. Database Performance Metrics (Last Hour) ===
PROMPT

SELECT 
    metric_name,
    ROUND(value, 2) current_value,
    metric_unit
FROM v$sysmetric
WHERE metric_name IN (
    'Database CPU Time Ratio',
    'Database Wait Time Ratio',
    'Memory Sorts Ratio',
    'Buffer Cache Hit Ratio',
    'Library Cache Hit Ratio',
    'Shared Pool Free %',
    'PGA Cache Hit %',
    'Executions Per Sec',
    'User Calls Per Sec',
    'Logical Reads Per Sec',
    'Physical Reads Per Sec',
    'Response Time Per Txn'
)
AND group_id = 2
ORDER BY metric_name;

PROMPT
PROMPT === 4. Top SQL by Elapsed Time (Last 7 Days) ===
PROMPT

SELECT * FROM (
    SELECT 
        sql_id,
        plan_hash_value,
        ROUND(elapsed_time/1000000, 2) elapsed_sec,
        executions,
        ROUND(elapsed_time/executions/1000000, 4) avg_elapsed_sec,
        ROUND(cpu_time/1000000, 2) cpu_sec,
        ROUND(buffer_gets/executions) avg_buffer_gets,
        SUBSTR(sql_text, 1, 80) sql_text
    FROM v$sql
    WHERE parsing_schema_name LIKE 'APEX_%'
       OR parsing_schema_name IN (SELECT schema FROM dba_registry WHERE comp_id = 'APEX')
       OR sql_text LIKE '%apex%'
    ORDER BY elapsed_time DESC
)
WHERE ROWNUM <= 20;

PROMPT
PROMPT === 5. Top SQL by CPU Time ===
PROMPT

SELECT * FROM (
    SELECT 
        sql_id,
        ROUND(cpu_time/1000000, 2) cpu_sec,
        executions,
        ROUND(cpu_time/executions/1000000, 4) avg_cpu_sec,
        ROUND(buffer_gets/executions) avg_buffer_gets,
        SUBSTR(sql_text, 1, 80) sql_text
    FROM v$sql
    WHERE parsing_schema_name LIKE 'APEX_%'
       OR parsing_schema_name IN (SELECT schema FROM dba_registry WHERE comp_id = 'APEX')
    ORDER BY cpu_time DESC
)
WHERE ROWNUM <= 20;

PROMPT
PROMPT === 6. Active Sessions and Wait Events ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    s.module,
    s.action,
    s.status,
    s.wait_class,
    s.event,
    s.seconds_in_wait,
    s.state,
    sq.sql_id,
    SUBSTR(sq.sql_text, 1, 60) sql_text
FROM v$session s
LEFT JOIN v$sql sq ON s.sql_id = sq.sql_id
WHERE s.username IS NOT NULL
  AND s.type = 'USER'
ORDER BY s.seconds_in_wait DESC;

PROMPT
PROMPT === 7. Top Wait Events (Last Hour) ===
PROMPT

SELECT 
    event,
    wait_class,
    total_waits,
    ROUND(time_waited/100, 2) time_waited_sec,
    ROUND(average_wait, 2) avg_wait_ms
FROM v$system_event
WHERE wait_class != 'Idle'
  AND total_waits > 0
ORDER BY time_waited DESC
FETCH FIRST 20 ROWS ONLY;

PROMPT
PROMPT === 8. APEX Schema Statistics - Last Analysis Date ===
PROMPT

SELECT 
    owner,
    table_name,
    num_rows,
    blocks,
    avg_row_len,
    TO_CHAR(last_analyzed, 'YYYY-MM-DD HH24:MI:SS') last_analyzed,
    ROUND((SYSDATE - last_analyzed), 2) days_since_analysis
FROM dba_tables
WHERE owner LIKE 'APEX_%'
   OR owner IN (SELECT schema FROM dba_registry WHERE comp_id = 'APEX')
ORDER BY last_analyzed NULLS FIRST;

PROMPT
PROMPT === 9. Missing Index Opportunities ===
PROMPT

SELECT 
    owner,
    table_name,
    column_name,
    num_distinct,
    density,
    num_nulls,
    num_buckets
FROM dba_tab_col_statistics
WHERE owner LIKE 'APEX_%'
  AND num_distinct > 100
  AND density < 0.01
ORDER BY num_distinct DESC
FETCH FIRST 30 ROWS ONLY;

PROMPT
PROMPT === 10. APEX Session State Size ===
PROMPT

SELECT 
    workspace,
    application_id,
    COUNT(*) active_sessions,
    ROUND(SUM(LENGTH(session_state))/1024/1024, 2) session_state_mb
FROM apex_workspace_activity_log
WHERE time_stamp > SYSDATE - 1
GROUP BY workspace, application_id
ORDER BY session_state_mb DESC;

PROMPT
PROMPT === 11. Table and Index Segments Size ===
PROMPT

SELECT 
    segment_name,
    segment_type,
    ROUND(bytes/1024/1024, 2) size_mb,
    blocks,
    extents
FROM dba_segments
WHERE owner LIKE 'APEX_%'
   OR owner IN (SELECT schema FROM dba_registry WHERE comp_id = 'APEX')
ORDER BY bytes DESC
FETCH FIRST 30 ROWS ONLY;

PROMPT
PROMPT === 12. Database Parameters for APEX Performance ===
PROMPT

SELECT 
    name,
    value,
    isdefault,
    description
FROM v$parameter
WHERE name IN (
    'optimizer_mode',
    'optimizer_index_cost_adj',
    'optimizer_index_caching',
    'cursor_sharing',
    'parallel_max_servers',
    'parallel_min_servers',
    'db_file_multiblock_read_count',
    'db_block_size',
    'undo_retention',
    'undo_tablespace'
)
ORDER BY name;

PROMPT
PROMPT === 13. PGA and UGA Memory Usage ===
PROMPT

SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    ROUND(p.value/1024/1024, 2) pga_mb,
    ROUND(u.value/1024/1024, 2) uga_mb
FROM v$session s
JOIN v$sesstat p ON s.sid = p.sid
JOIN v$sesstat u ON s.sid = u.sid
WHERE p.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'session pga memory')
  AND u.statistic# = (SELECT statistic# FROM v$statname WHERE name = 'session uga memory')
  AND s.username IS NOT NULL
ORDER BY p.value DESC
FETCH FIRST 20 ROWS ONLY;

PROMPT
PROMPT === 14. APEX Page Performance Statistics ===
PROMPT

SELECT 
    application_id,
    page_id,
    COUNT(*) page_views,
    ROUND(AVG(elapsed_time), 4) avg_elapsed_time,
    ROUND(MAX(elapsed_time), 4) max_elapsed_time,
    ROUND(AVG(num_rows), 0) avg_rows
FROM apex_workspace_activity_log
WHERE time_stamp > SYSDATE - 7
  AND elapsed_time > 0
GROUP BY application_id, page_id
ORDER BY avg_elapsed_time DESC
FETCH FIRST 30 ROWS ONLY;

PROMPT
PROMPT === 15. Locking and Blocking Sessions ===
PROMPT

SELECT 
    LPAD(' ', LEVEL-1, ' ') || s.sid || ',' || s.serial# blocking_tree,
    s.username,
    s.program,
    s.status,
    s.wait_class,
    s.event,
    o.object_name,
    l.lock_type,
    l.mode_held
FROM v$session s
LEFT JOIN v$lock l ON s.sid = l.sid
LEFT JOIN dba_objects o ON l.id1 = o.object_id
WHERE s.blocking_session IS NOT NULL
   OR s.sid IN (SELECT blocking_session FROM v$session WHERE blocking_session IS NOT NULL)
START WITH s.blocking_session IS NULL
CONNECT BY PRIOR s.sid = s.blocking_session
ORDER SIBLINGS BY s.sid;

PROMPT
PROMPT === 16. Tablespace Usage ===
PROMPT

SELECT 
    tablespace_name,
    ROUND(total_space_mb, 2) total_mb,
    ROUND(used_space_mb, 2) used_mb,
    ROUND(free_space_mb, 2) free_mb,
    ROUND(used_percent, 2) used_percent
FROM (
    SELECT 
        df.tablespace_name,
        df.total_space/1024/1024 total_space_mb,
        (df.total_space - fs.free_space)/1024/1024 used_space_mb,
        fs.free_space/1024/1024 free_space_mb,
        ((df.total_space - fs.free_space)/df.total_space) * 100 used_percent
    FROM (
        SELECT tablespace_name, SUM(bytes) total_space
        FROM dba_data_files
        GROUP BY tablespace_name
    ) df,
    (
        SELECT tablespace_name, SUM(bytes) free_space
        FROM dba_free_space
        GROUP BY tablespace_name
    ) fs
    WHERE df.tablespace_name = fs.tablespace_name
)
ORDER BY used_percent DESC;

PROMPT
PROMPT === 17. Invalid Objects in APEX Schemas ===
PROMPT

SELECT 
    owner,
    object_type,
    object_name,
    status,
    TO_CHAR(last_ddl_time, 'YYYY-MM-DD HH24:MI:SS') last_ddl_time
FROM dba_objects
WHERE owner LIKE 'APEX_%'
  AND status = 'INVALID'
ORDER BY owner, object_type, object_name;

PROMPT
PROMPT ============================================================================
PROMPT End of Performance Diagnostic Report
PROMPT ============================================================================
PROMPT
PROMPT Recommendations:
PROMPT 1. Review top SQL queries and optimize as needed
PROMPT 2. Check if statistics are current (< 7 days old)
PROMPT 3. Monitor wait events - focus on non-Idle waits
PROMPT 4. Ensure sufficient PGA and SGA allocation
PROMPT 5. Review blocking sessions if any exist
PROMPT 6. Compile invalid objects if found
PROMPT ============================================================================

SET FEEDBACK ON
SET VERIFY ON
