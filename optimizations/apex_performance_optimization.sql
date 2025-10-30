-- ============================================================================
-- APEX Performance Optimization Script
-- ============================================================================
-- Purpose: Apply performance optimizations to APEX installation and apps
-- WARNING: Review and test each section before running in production
-- ============================================================================

SET SERVEROUTPUT ON
SET VERIFY OFF

PROMPT ============================================================================
PROMPT APEX Performance Optimization Script
PROMPT ============================================================================
PROMPT
PROMPT This script will optimize various aspects of your APEX installation
PROMPT Please review each section before executing
PROMPT ============================================================================

-- ========== 1. Gather Statistics on APEX Schemas ==========

PROMPT
PROMPT === Gathering Statistics on APEX Schemas ===
PROMPT This may take several minutes...
PROMPT

BEGIN
    -- Get APEX schema name
    FOR apex_schema IN (
        SELECT schema 
        FROM dba_registry 
        WHERE comp_id = 'APEX'
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Gathering stats for: ' || apex_schema.schema);
        
        DBMS_STATS.GATHER_SCHEMA_STATS(
            ownname          => apex_schema.schema,
            estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
            method_opt       => 'FOR ALL COLUMNS SIZE AUTO',
            degree           => 4,
            cascade          => TRUE,
            options          => 'GATHER AUTO'
        );
        
        DBMS_OUTPUT.PUT_LINE('Statistics gathered successfully for: ' || apex_schema.schema);
    END LOOP;
    
    -- Gather stats on workspace schemas (if accessible)
    FOR ws_schema IN (
        SELECT DISTINCT schema
        FROM apex_workspace_schemas
        WHERE schema NOT LIKE 'APEX_%'
    ) LOOP
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Gathering stats for workspace schema: ' || ws_schema.schema);
            
            DBMS_STATS.GATHER_SCHEMA_STATS(
                ownname          => ws_schema.schema,
                estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
                method_opt       => 'FOR ALL COLUMNS SIZE AUTO',
                degree           => 4,
                cascade          => TRUE,
                options          => 'GATHER AUTO'
            );
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('  Skipped (insufficient privileges): ' || ws_schema.schema);
        END;
    END LOOP;
END;
/

-- ========== 2. Enable Result Cache for APEX Queries ==========

PROMPT
PROMPT === Configuring Result Cache ===
PROMPT

-- Check current result cache settings
SELECT 
    name, 
    value, 
    description
FROM v$parameter
WHERE name LIKE '%result_cache%';

-- Enable result cache if not already set (requires restart)
-- ALTER SYSTEM SET result_cache_max_size = 256M SCOPE=BOTH;
-- ALTER SYSTEM SET result_cache_mode = FORCE SCOPE=BOTH;

PROMPT
PROMPT NOTE: To enable result cache, uncomment and run:
PROMPT   ALTER SYSTEM SET result_cache_max_size = 256M SCOPE=BOTH;
PROMPT   ALTER SYSTEM SET result_cache_mode = FORCE SCOPE=BOTH;
PROMPT

-- ========== 3. Optimize APEX Session State ==========

PROMPT
PROMPT === Purging Old APEX Session State ===
PROMPT

-- Purge sessions older than 2 days (adjust as needed)
BEGIN
    APEX_UTIL.PURGE_SESSIONS_BY_AGE(
        p_age_in_hours => 48
    );
    DBMS_OUTPUT.PUT_LINE('Old sessions purged successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error purging sessions: ' || SQLERRM);
END;
/

-- ========== 4. Optimize APEX Collection Cleanup ==========

PROMPT
PROMPT === Cleaning Up Old APEX Collections ===
PROMPT

-- Clean up old collections
BEGIN
    FOR c IN (
        SELECT collection_id
        FROM apex_collections
        WHERE created_on < SYSDATE - 7  -- Older than 7 days
    ) LOOP
        BEGIN
            APEX_COLLECTION.DELETE_COLLECTION(
                p_collection_id => c.collection_id
            );
        EXCEPTION
            WHEN OTHERS THEN
                NULL;  -- Continue on error
        END;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Old collections cleaned up');
END;
/

-- ========== 5. Create Missing Indexes (Review Before Running) ==========

PROMPT
PROMPT === Recommended Index Creation ===
PROMPT Review these index suggestions carefully before creating
PROMPT

-- Example indexes for common APEX metadata queries
-- Uncomment and adjust based on your specific needs

/*
-- Index on workspace activity log for performance queries
CREATE INDEX apex_activity_log_perf_idx 
ON apex_workspace_activity_log(application_id, page_id, time_stamp)
TABLESPACE users;

-- Index for session state queries
CREATE INDEX apex_session_state_idx 
ON apex_session_state(session_id, application_id)
TABLESPACE users;
*/

PROMPT
PROMPT Review and uncomment index creation statements as needed
PROMPT

-- ========== 6. Configure Workspace Preferences for Performance ==========

PROMPT
PROMPT === Configuring APEX Workspace Preferences ===
PROMPT

-- Set workspace preferences for better performance
BEGIN
    -- Enable automatic session purging
    APEX_INSTANCE_ADMIN.SET_PARAMETER(
        p_parameter => 'WORKSPACE_MAX_SESSION_IDLE_SEC',
        p_value     => '3600'  -- 1 hour
    );
    
    -- Set maximum session length
    APEX_INSTANCE_ADMIN.SET_PARAMETER(
        p_parameter => 'WORKSPACE_MAX_SESSION_LENGTH_SEC',
        p_value     => '28800'  -- 8 hours
    );
    
    DBMS_OUTPUT.PUT_LINE('Workspace preferences configured');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Note: Some settings require APEX administrator privileges');
END;
/

-- ========== 7. Optimize APEX File Storage ==========

PROMPT
PROMPT === Analyzing APEX File Storage ===
PROMPT

-- Check size of workspace files
SELECT 
    workspace,
    COUNT(*) file_count,
    ROUND(SUM(LENGTH(file_content))/1024/1024, 2) total_mb
FROM apex_application_files
GROUP BY workspace
ORDER BY total_mb DESC;

PROMPT
PROMPT Consider moving large files to:
PROMPT 1. External web server
PROMPT 2. Object storage (S3, OCI Object Storage)
PROMPT 3. CDN for better performance
PROMPT

-- ========== 8. Compile Invalid Objects ==========

PROMPT
PROMPT === Recompiling Invalid Objects ===
PROMPT

BEGIN
    FOR obj IN (
        SELECT owner, object_name, object_type
        FROM dba_objects
        WHERE status = 'INVALID'
          AND owner LIKE 'APEX_%'
    ) LOOP
        BEGIN
            IF obj.object_type = 'PACKAGE' THEN
                EXECUTE IMMEDIATE 'ALTER PACKAGE ' || obj.owner || '.' || obj.object_name || ' COMPILE';
            ELSIF obj.object_type = 'PACKAGE BODY' THEN
                EXECUTE IMMEDIATE 'ALTER PACKAGE ' || obj.owner || '.' || obj.object_name || ' COMPILE BODY';
            ELSIF obj.object_type = 'VIEW' THEN
                EXECUTE IMMEDIATE 'ALTER VIEW ' || obj.owner || '.' || obj.object_name || ' COMPILE';
            ELSIF obj.object_type = 'PROCEDURE' THEN
                EXECUTE IMMEDIATE 'ALTER PROCEDURE ' || obj.owner || '.' || obj.object_name || ' COMPILE';
            ELSIF obj.object_type = 'FUNCTION' THEN
                EXECUTE IMMEDIATE 'ALTER FUNCTION ' || obj.owner || '.' || obj.object_name || ' COMPILE';
            ELSIF obj.object_type = 'TRIGGER' THEN
                EXECUTE IMMEDIATE 'ALTER TRIGGER ' || obj.owner || '.' || obj.object_name || ' COMPILE';
            END IF;
            
            DBMS_OUTPUT.PUT_LINE('Compiled: ' || obj.owner || '.' || obj.object_name);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Failed to compile: ' || obj.owner || '.' || obj.object_name || ' - ' || SQLERRM);
        END;
    END LOOP;
END;
/

-- ========== 9. Page Designer Specific Optimizations ==========

PROMPT
PROMPT === Page Designer Specific Settings ===
PROMPT

-- These settings can improve Page Designer performance
-- Set at instance level (requires APEX administrator)

BEGIN
    -- Increase page designer timeout
    APEX_INSTANCE_ADMIN.SET_PARAMETER(
        p_parameter => 'PAGE_DESIGNER_TIMEOUT',
        p_value     => '3600'
    );
    
    -- Enable Page Designer caching
    APEX_INSTANCE_ADMIN.SET_PARAMETER(
        p_parameter => 'PAGE_DESIGNER_CACHE_ENABLED',
        p_value     => 'Y'
    );
    
    DBMS_OUTPUT.PUT_LINE('Page Designer settings optimized');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Note: Page Designer settings require APEX_ADMINISTRATOR_ROLE');
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- ========== 10. Database Link Performance (if used) ==========

PROMPT
PROMPT === Checking Database Links ===
PROMPT

SELECT 
    owner,
    db_link,
    username,
    host
FROM dba_db_links
WHERE owner IN (SELECT schema FROM dba_registry WHERE comp_id = 'APEX')
   OR owner IN (SELECT DISTINCT schema FROM apex_workspace_schemas);

PROMPT
PROMPT If using database links, ensure:
PROMPT 1. Network latency is minimal
PROMPT 2. Remote database is also optimized
PROMPT 3. Consider replicating data locally
PROMPT

-- ========== 11. PL/SQL Gateway Cache ==========

PROMPT
PROMPT === PL/SQL Gateway Cache Configuration ===
PROMPT

-- Check current cache settings
BEGIN
    DBMS_OUTPUT.PUT_LINE('Current cache settings:');
    FOR param IN (
        SELECT 
            param_name,
            param_value
        FROM wwv_flow_platform_prefs
        WHERE param_name LIKE '%CACHE%'
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('  ' || param.param_name || ' = ' || param.param_value);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Cache settings not accessible');
END;
/

-- ========== 12. Summary and Recommendations ==========

PROMPT
PROMPT ============================================================================
PROMPT Optimization Complete
PROMPT ============================================================================
PROMPT
PROMPT Next Steps:
PROMPT 1. Monitor database performance after these changes
PROMPT 2. Run AWR report to compare before/after metrics
PROMPT 3. Test Page Designer performance in your applications
PROMPT 4. Schedule regular statistics gathering (weekly recommended)
PROMPT 5. Set up automatic session cleanup job
PROMPT
PROMPT Additional Recommendations:
PROMPT 1. Consider Application-Level Caching:
PROMPT    - Use APEX Region Caching where appropriate
PROMPT    - Cache static LOVs at application level
PROMPT    - Use Collection caching for query results
PROMPT
PROMPT 2. Optimize Page Load:
PROMPT    - Minimize number of regions per page
PROMPT    - Use lazy loading for non-critical content
PROMPT    - Reduce JavaScript/CSS file sizes
PROMPT
PROMPT 3. Database Tuning:
PROMPT    - Review and optimize slow SQL (use db_performance_check.sql)
PROMPT    - Add indexes based on query patterns
PROMPT    - Consider partitioning large tables
PROMPT
PROMPT 4. ORDS Tuning:
PROMPT    - Configure connection pool (see config-templates/ords-defaults.xml)
PROMPT    - Enable statement caching
PROMPT    - Monitor connection usage
PROMPT
PROMPT 5. Tomcat Tuning:
PROMPT    - Configure JVM memory (see config-templates/jvm-tuning.sh)
PROMPT    - Enable HTTP compression
PROMPT    - Tune thread pool size
PROMPT
PROMPT ============================================================================

-- Create a job to automatically gather statistics weekly
PROMPT
PROMPT === Creating Automatic Statistics Gathering Job ===
PROMPT

BEGIN
    -- Drop existing job if it exists
    BEGIN
        DBMS_SCHEDULER.DROP_JOB(job_name => 'APEX_STATS_GATHER_JOB', force => TRUE);
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    
    -- Create new job to gather statistics weekly
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'APEX_STATS_GATHER_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => q'[
            BEGIN
                FOR apex_schema IN (
                    SELECT schema FROM dba_registry WHERE comp_id = 'APEX'
                ) LOOP
                    DBMS_STATS.GATHER_SCHEMA_STATS(
                        ownname          => apex_schema.schema,
                        estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
                        method_opt       => 'FOR ALL COLUMNS SIZE AUTO',
                        degree           => 4,
                        cascade          => TRUE
                    );
                END LOOP;
            END;
        ]',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=WEEKLY;BYDAY=SUN;BYHOUR=2;BYMINUTE=0;BYSECOND=0',
        enabled         => TRUE,
        comments        => 'Gather statistics on APEX schemas weekly'
    );
    
    DBMS_OUTPUT.PUT_LINE('Automatic statistics gathering job created');
    DBMS_OUTPUT.PUT_LINE('Job will run every Sunday at 2:00 AM');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Could not create scheduler job: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('You may need DBA privileges to create scheduler jobs');
END;
/

PROMPT
PROMPT ============================================================================
PROMPT Script execution complete!
PROMPT Check the output above for any errors or warnings
PROMPT ============================================================================
