-- ============================================================================
-- Recommended Indexes for APEX Performance
-- ============================================================================
-- Purpose: Create additional indexes to improve APEX Page Designer performance
-- WARNING: Test in non-production first. Monitor space usage.
-- ============================================================================

SET SERVEROUTPUT ON

PROMPT ============================================================================
PROMPT APEX Performance Index Creation
PROMPT ============================================================================
PROMPT
PROMPT This script creates indexes to improve APEX metadata query performance
PROMPT Review each index before creation
PROMPT Monitor index usage with: 
PROMPT   SELECT * FROM v$index_usage_info WHERE name = 'index_name';
PROMPT ============================================================================

-- ========== 1. Check Existing Indexes ==========

PROMPT
PROMPT === Current Indexes on APEX Metadata Tables ===
PROMPT

SELECT 
    table_owner,
    table_name,
    index_name,
    uniqueness,
    status,
    ROUND(bytes/1024/1024, 2) size_mb
FROM dba_indexes i
JOIN dba_segments s ON i.owner = s.owner AND i.index_name = s.segment_name
WHERE table_owner LIKE 'APEX_%'
  AND table_name IN (
      'WWV_FLOW_PAGES',
      'WWV_FLOW_PAGE_PLUGS',
      'WWV_FLOW_STEP_ITEMS',
      'WWV_FLOW_ACTIVITY_LOG1$',
      'WWV_FLOW_ACTIVITY_LOG2$',
      'WWV_FLOW_COLLECTIONS$'
  )
ORDER BY table_owner, table_name, index_name;

-- ========== 2. Workspace Activity Log Indexes ==========

PROMPT
PROMPT === Creating Activity Log Performance Indexes ===
PROMPT

-- Index for time-based queries
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    -- Get APEX schema name
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    -- Check if index exists
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_ACTIVITY_TIME_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_ACTIVITY_TIME_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOW_ACTIVITY_LOG1$(TIME_STAMP, APPLICATION_ID, PAGE_ID) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_ACTIVITY_TIME_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_ACTIVITY_TIME_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_ACTIVITY_TIME_IDX: ' || SQLERRM);
END;
/

-- Index for application/page lookup
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_ACTIVITY_APP_PAGE_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_ACTIVITY_APP_PAGE_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOW_ACTIVITY_LOG1$(APPLICATION_ID, PAGE_ID, USERID) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_ACTIVITY_APP_PAGE_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_ACTIVITY_APP_PAGE_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_ACTIVITY_APP_PAGE_IDX: ' || SQLERRM);
END;
/

-- ========== 3. Session State Indexes ==========

PROMPT
PROMPT === Creating Session State Indexes ===
PROMPT

-- Index for session lookup
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_SESSION_STATE_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_SESSION_STATE_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOW_DATA(FLOW_ID, PAGE_ID, SESSION_ID) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_SESSION_STATE_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_SESSION_STATE_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_SESSION_STATE_IDX: ' || SQLERRM);
END;
/

-- ========== 4. Collection Performance Indexes ==========

PROMPT
PROMPT === Creating Collection Performance Indexes ===
PROMPT

-- Index for collection cleanup
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_COLLECTIONS_CLEANUP_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_COLLECTIONS_CLEANUP_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOW_COLLECTIONS$(SESSION_ID, COLLECTION_NAME) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_COLLECTIONS_CLEANUP_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_COLLECTIONS_CLEANUP_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_COLLECTIONS_CLEANUP_IDX: ' || SQLERRM);
END;
/

-- ========== 5. Page Definition Indexes ==========

PROMPT
PROMPT === Creating Page Definition Indexes ===
PROMPT

-- Index for page component lookup
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_PAGE_PLUGS_PERF_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_PAGE_PLUGS_PERF_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOW_PAGE_PLUGS(FLOW_ID, PAGE_ID, PLUG_DISPLAY_SEQUENCE) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_PAGE_PLUGS_PERF_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_PAGE_PLUGS_PERF_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_PAGE_PLUGS_PERF_IDX: ' || SQLERRM);
END;
/

-- Index for page items
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_PAGE_ITEMS_PERF_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_PAGE_ITEMS_PERF_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOW_STEP_ITEMS(FLOW_ID, FLOW_STEP_ID, DISPLAY_SEQUENCE) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_PAGE_ITEMS_PERF_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_PAGE_ITEMS_PERF_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_PAGE_ITEMS_PERF_IDX: ' || SQLERRM);
END;
/

-- ========== 6. Function-Based Indexes for Case-Insensitive Searches ==========

PROMPT
PROMPT === Creating Function-Based Indexes ===
PROMPT

-- Index for application name search
DECLARE
    v_index_exists NUMBER;
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    SELECT COUNT(*) INTO v_index_exists
    FROM dba_indexes
    WHERE owner = v_apex_schema
      AND index_name = 'APEX_FLOW_NAME_UPPER_IDX';
    
    IF v_index_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_apex_schema || '.APEX_FLOW_NAME_UPPER_IDX ' ||
                         'ON ' || v_apex_schema || '.WWV_FLOWS(UPPER(NAME)) ' ||
                         'TABLESPACE APEX';
        DBMS_OUTPUT.PUT_LINE('Created: APEX_FLOW_NAME_UPPER_IDX');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Already exists: APEX_FLOW_NAME_UPPER_IDX');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating APEX_FLOW_NAME_UPPER_IDX: ' || SQLERRM);
END;
/

-- ========== 7. Verify Index Creation ==========

PROMPT
PROMPT === Newly Created Indexes ===
PROMPT

SELECT 
    owner,
    index_name,
    table_name,
    uniqueness,
    status,
    TO_CHAR(last_ddl_time, 'YYYY-MM-DD HH24:MI:SS') created_date
FROM dba_indexes
WHERE owner LIKE 'APEX_%'
  AND index_name LIKE '%PERF_IDX'
   OR index_name LIKE '%CLEANUP_IDX'
   OR index_name LIKE '%UPPER_IDX'
ORDER BY last_ddl_time DESC;

-- ========== 8. Index Monitoring ==========

PROMPT
PROMPT === Enabling Index Monitoring ===
PROMPT

DECLARE
    v_apex_schema VARCHAR2(128);
BEGIN
    SELECT schema INTO v_apex_schema
    FROM dba_registry 
    WHERE comp_id = 'APEX'
    AND ROWNUM = 1;
    
    -- Enable monitoring on new indexes
    FOR idx IN (
        SELECT index_name
        FROM dba_indexes
        WHERE owner = v_apex_schema
          AND (index_name LIKE '%PERF_IDX' 
           OR index_name LIKE '%CLEANUP_IDX'
           OR index_name LIKE '%UPPER_IDX')
    ) LOOP
        BEGIN
            EXECUTE IMMEDIATE 'ALTER INDEX ' || v_apex_schema || '.' || idx.index_name || ' MONITORING USAGE';
            DBMS_OUTPUT.PUT_LINE('Monitoring enabled: ' || idx.index_name);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Could not enable monitoring: ' || idx.index_name);
        END;
    END LOOP;
END;
/

PROMPT
PROMPT ============================================================================
PROMPT Index Creation Complete
PROMPT ============================================================================
PROMPT
PROMPT Monitoring:
PROMPT 1. Check index usage after 1-2 weeks:
PROMPT    SELECT * FROM v$index_usage_info WHERE name LIKE '%PERF_IDX%';
PROMPT
PROMPT 2. Monitor index space:
PROMPT    SELECT index_name, ROUND(bytes/1024/1024,2) mb 
PROMPT    FROM dba_segments 
PROMPT    WHERE segment_name LIKE '%PERF_IDX%';
PROMPT
PROMPT 3. Check for unused indexes:
PROMPT    SELECT * FROM dba_index_usage 
PROMPT    WHERE owner LIKE 'APEX_%' AND total_access_count = 0;
PROMPT
PROMPT 4. Rebuild indexes if fragmented:
PROMPT    ALTER INDEX index_name REBUILD ONLINE;
PROMPT
PROMPT Next Steps:
PROMPT 1. Monitor query performance improvement
PROMPT 2. Check execution plans use new indexes
PROMPT 3. Gather statistics on new indexes:
PROMPT    EXEC DBMS_STATS.GATHER_INDEX_STATS('schema', 'index_name');
PROMPT
PROMPT ============================================================================
