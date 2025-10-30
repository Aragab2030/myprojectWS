-- Oracle Database 23ai Performance Optimizations for Oracle APEX Page Designer
-- Run these as DBA user (SYS or SYSTEM)

-- ============================================================================
-- 1. APEX Schema Optimizations
-- ============================================================================

-- Analyze APEX schema objects to ensure statistics are current
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('APEX_230200', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, METHOD_OPT => 'FOR ALL COLUMNS SIZE AUTO', CASCADE => TRUE);

-- Analyze APEX_RUNTIME schema if separate
BEGIN
    IF USER IN ('SYS', 'SYSTEM') THEN
        EXECUTE IMMEDIATE 'BEGIN DBMS_STATS.GATHER_SCHEMA_STATS(''APEX_RUNTIME'', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, METHOD_OPT => ''FOR ALL COLUMNS SIZE AUTO'', CASCADE => TRUE); END;';
    END IF;
END;
/

-- ============================================================================
-- 2. Session and Cursor Optimizations
-- ============================================================================

-- Increase open cursors limit (adjust based on your needs)
ALTER SYSTEM SET OPEN_CURSORS=1000 SCOPE=SPFILE;

-- Optimize cursor sharing (Oracle 23ai default is usually good)
ALTER SYSTEM SET CURSOR_SHARING=EXACT SCOPE=SPFILE;

-- Increase session cached cursors
ALTER SYSTEM SET SESSION_CACHED_CURSORS=200 SCOPE=SPFILE;

-- ============================================================================
-- 3. Memory Configuration
-- ============================================================================

-- Check current memory settings (review output before making changes)
SELECT name, value, unit FROM v$parameter 
WHERE name IN ('sga_target', 'sga_max_size', 'pga_aggregate_target', 'memory_target', 'memory_max_target')
ORDER BY name;

-- For dedicated server, ensure adequate PGA
-- Example (adjust based on your system):
-- ALTER SYSTEM SET PGA_AGGREGATE_TARGET=2G SCOPE=SPFILE;

-- ============================================================================
-- 4. APEX Workspace-Specific Optimizations
-- ============================================================================

-- Analyze tables frequently accessed by Page Designer
-- APEX application metadata tables
BEGIN
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_PAGES', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_PAGE_PROCESSES', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_PAGE_BRANCHES', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_STEP_ITEMS', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_ITEMS', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_PAGE_REGIONS', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
    DBMS_STATS.GATHER_TABLE_STATS('APEX_230200', 'WWV_FLOW_WORKSHEET_RPT_COLS', ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, CASCADE => TRUE);
END;
/

-- ============================================================================
-- 5. Index Maintenance
-- ============================================================================

-- Check for missing or unused indexes (review output and create as needed)
-- This query identifies tables that might benefit from indexes
SELECT 
    t.owner,
    t.table_name,
    t.num_rows,
    COUNT(i.index_name) as index_count
FROM all_tables t
LEFT JOIN all_indexes i ON t.owner = i.table_owner AND t.table_name = i.table_name
WHERE t.owner LIKE 'APEX%'
  AND t.num_rows > 1000
GROUP BY t.owner, t.table_name, t.num_rows
HAVING COUNT(i.index_name) < 2
ORDER BY t.num_rows DESC;

-- ============================================================================
-- 6. Query Result Cache Configuration
-- ============================================================================

-- Enable result cache for APEX queries (Oracle 23ai optimizes this automatically)
ALTER SYSTEM SET RESULT_CACHE_MODE=MANUAL SCOPE=SPFILE;
ALTER SYSTEM SET RESULT_CACHE_MAX_SIZE=256M SCOPE=SPFILE;

-- ============================================================================
-- 7. Optimizer Settings
-- ============================================================================

-- Check current optimizer settings
SELECT name, value FROM v$parameter 
WHERE name LIKE '%optimizer%'
ORDER BY name;

-- For Oracle 23ai, the default optimizer (19c+) is usually optimal
-- Ensure you're using the latest optimizer features:
SELECT value FROM v$parameter WHERE name = 'optimizer_features_enable';
-- Should be 23.0.0 or higher

-- ============================================================================
-- 8. Partitioning and Compression (if applicable)
-- ============================================================================

-- Check if large APEX tables would benefit from partitioning
SELECT 
    owner,
    table_name,
    num_rows,
    blocks,
    last_analyzed
FROM all_tables
WHERE owner LIKE 'APEX%'
  AND num_rows > 1000000
ORDER BY num_rows DESC;

-- Consider partitioning large audit/workspace tables if they exist
-- This requires careful planning and testing

-- ============================================================================
-- 9. AWR and Performance Monitoring
-- ============================================================================

-- Enable AWR snapshots more frequently for performance analysis
EXEC DBMS_WORKLOAD_REPOSITORY.MODIFY_SNAPSHOT_SETTINGS(RETENTION => 43200, INTERVAL => 30);
-- Retention: 30 days (43200 minutes)
-- Interval: 30 minutes

-- ============================================================================
-- 10. Shared Server vs Dedicated Server
-- ============================================================================

-- Check current connection mode
SELECT name, value FROM v$parameter WHERE name = 'shared_servers';

-- For ORDS with connection pooling, dedicated server is typically better
-- But verify your setup

-- ============================================================================
-- 11. Redo Log Optimization
-- ============================================================================

-- Ensure redo logs are sized appropriately (minimum 100MB each)
SELECT 
    group#,
    bytes/1024/1024 as size_mb,
    members,
    status,
    archived
FROM v$log
ORDER BY group#;

-- If redo logs are small (< 100MB), consider increasing size:
-- ALTER DATABASE ADD LOGFILE GROUP 4 ('/path/to/logfile1.log') SIZE 200M;
-- (Requires downtime and careful planning)

-- ============================================================================
-- 12. Temp Tablespace Optimization
-- ============================================================================

-- Check temp tablespace configuration
SELECT 
    tablespace_name,
    file_name,
    bytes/1024/1024/1024 as size_gb,
    autoextensible,
    maxbytes/1024/1024/1024 as max_size_gb
FROM dba_temp_files
ORDER BY tablespace_name;

-- Ensure temp tablespace is large enough for complex Page Designer operations
-- Consider increasing if frequently hitting temp space errors

-- ============================================================================
-- 13. Application-Specific Queries
-- ============================================================================

-- Identify slow queries related to Page Designer
-- Run this during active Page Designer usage and review results
SELECT 
    sql_id,
    sql_text,
    executions,
    elapsed_time/1000000 as elapsed_seconds,
    elapsed_time/1000000/executions as avg_elapsed_seconds,
    buffer_gets,
    disk_reads
FROM v$sql
WHERE UPPER(sql_text) LIKE '%WWV_FLOW%'
  AND executions > 10
ORDER BY elapsed_time DESC
FETCH FIRST 20 ROWS ONLY;

-- ============================================================================
-- 14. Lock Monitoring
-- ============================================================================

-- Check for blocking locks that might affect Page Designer
SELECT 
    l1.sid AS blocking_sid,
    l2.sid AS waiting_sid,
    l1.type AS lock_type,
    l1.id1,
    l1.id2
FROM v$lock l1, v$lock l2
WHERE l1.block = 1
  AND l2.request > 0
  AND l1.id1 = l2.id1
  AND l1.id2 = l2.id2;

-- ============================================================================
-- 15. Network Configuration
-- ============================================================================

-- Check SQL*Net settings (in sqlnet.ora)
-- Ensure TCP.NODELAY is set for better performance:
-- TCP.NODELAY=yes

-- ============================================================================
-- NOTES AND RECOMMENDATIONS:
-- ============================================================================
-- 1. Many of these changes require database restart (SCOPE=SPFILE)
-- 2. Always test in a non-production environment first
-- 3. Monitor AWR reports before and after changes
-- 4. Consider Oracle 23ai's automatic indexing feature
-- 5. Use Real-Time SQL Monitoring for slow queries
-- 6. Review ADDM reports regularly for optimization opportunities
-- 7. Ensure Oracle Database 23ai patches are current
-- 8. Consider using Oracle Database In-Memory option if available

-- ============================================================================
-- Post-Change Verification Queries
-- ============================================================================

-- After applying changes, verify:
SELECT name, value FROM v$parameter 
WHERE name IN (
    'open_cursors',
    'session_cached_cursors',
    'cursor_sharing',
    'pga_aggregate_target',
    'result_cache_max_size'
)
ORDER BY name;
