-- ============================================================================
-- APEX Metadata Performance Check
-- ============================================================================
-- Purpose: Analyze APEX metadata tables for performance issues
-- Focus: Page Designer specific metadata queries
-- ============================================================================

SET PAGESIZE 1000
SET LINESIZE 200
SET SERVEROUTPUT ON

PROMPT ============================================================================
PROMPT APEX Metadata Performance Analysis
PROMPT ============================================================================

PROMPT
PROMPT === 1. Large APEX Applications (Potential Performance Impact) ===
PROMPT

SELECT 
    application_id,
    application_name,
    page_count,
    region_count,
    item_count,
    process_count,
    validation_count,
    computation_count,
    dynamic_action_count
FROM (
    SELECT 
        a.application_id,
        a.application_name,
        (SELECT COUNT(*) FROM apex_application_pages p WHERE p.application_id = a.application_id) page_count,
        (SELECT COUNT(*) FROM apex_application_page_regions r WHERE r.application_id = a.application_id) region_count,
        (SELECT COUNT(*) FROM apex_application_page_items i WHERE i.application_id = a.application_id) item_count,
        (SELECT COUNT(*) FROM apex_application_page_proc pr WHERE pr.application_id = a.application_id) process_count,
        (SELECT COUNT(*) FROM apex_application_page_val v WHERE v.application_id = a.application_id) validation_count,
        (SELECT COUNT(*) FROM apex_application_page_comp c WHERE c.application_id = a.application_id) computation_count,
        (SELECT COUNT(*) FROM apex_application_page_da d WHERE d.application_id = a.application_id) dynamic_action_count
    FROM apex_applications a
)
ORDER BY page_count DESC, region_count DESC;

PROMPT
PROMPT === 2. Complex Pages (Many Items/Regions) ===
PROMPT

SELECT 
    application_id,
    page_id,
    page_name,
    item_count,
    region_count,
    da_count,
    button_count,
    process_count,
    (item_count + region_count + da_count + button_count + process_count) complexity_score
FROM (
    SELECT 
        p.application_id,
        p.page_id,
        p.page_name,
        (SELECT COUNT(*) FROM apex_application_page_items i WHERE i.application_id = p.application_id AND i.page_id = p.page_id) item_count,
        (SELECT COUNT(*) FROM apex_application_page_regions r WHERE r.application_id = p.application_id AND r.page_id = p.page_id) region_count,
        (SELECT COUNT(*) FROM apex_application_page_da d WHERE d.application_id = p.application_id AND d.page_id = p.page_id) da_count,
        (SELECT COUNT(*) FROM apex_application_page_buttons b WHERE b.application_id = p.application_id AND b.page_id = p.page_id) button_count,
        (SELECT COUNT(*) FROM apex_application_page_proc pr WHERE pr.application_id = p.application_id AND pr.page_id = p.page_id) process_count
    FROM apex_application_pages p
)
WHERE item_count + region_count + da_count + button_count + process_count > 50
ORDER BY complexity_score DESC;

PROMPT
PROMPT === 3. Dynamic Actions with Complex JavaScript ===
PROMPT

SELECT 
    application_id,
    page_id,
    dynamic_action_name,
    LENGTH(action_code) js_length,
    event_name,
    when_element_type,
    execution_type
FROM apex_application_page_da_acts
WHERE action_code IS NOT NULL
  AND LENGTH(action_code) > 1000
ORDER BY js_length DESC
FETCH FIRST 30 ROWS ONLY;

PROMPT
PROMPT === 4. Regions with Complex Queries ===
PROMPT

SELECT 
    application_id,
    page_id,
    region_name,
    source_type,
    LENGTH(region_source) query_length,
    CASE 
        WHEN UPPER(region_source) LIKE '%WITH%' THEN 'CTE'
        WHEN UPPER(region_source) LIKE '%UNION%' THEN 'UNION'
        WHEN UPPER(region_source) LIKE '%SUBQUERY%' THEN 'SUBQUERY'
        ELSE 'STANDARD'
    END query_complexity
FROM apex_application_page_regions
WHERE region_source IS NOT NULL
  AND LENGTH(region_source) > 500
  AND source_type IN ('SQL Query', 'SQL Query (return single value)')
ORDER BY query_length DESC
FETCH FIRST 30 ROWS ONLY;

PROMPT
PROMPT === 5. Items with Item-Level Calculations ===
PROMPT

SELECT 
    application_id,
    page_id,
    item_name,
    display_as,
    LENGTH(item_default) default_length,
    LENGTH(lov_definition) lov_length
FROM apex_application_page_items
WHERE (LENGTH(item_default) > 500 OR LENGTH(lov_definition) > 500)
ORDER BY default_length DESC, lov_length DESC;

PROMPT
PROMPT === 6. Applications Using Deprecated Features ===
PROMPT

SELECT 
    application_id,
    application_name,
    page_id,
    region_name,
    'Legacy report type: ' || source_type_code issue
FROM apex_application_page_regions
WHERE source_type_code IN ('CLASSIC_REPORT', 'SQL_REPORT')
UNION ALL
SELECT 
    application_id,
    application_name,
    page_id,
    item_name,
    'Legacy item type: ' || display_as_code issue
FROM apex_application_page_items
WHERE display_as_code IN ('NATIVE_POPUP_LOV', 'NATIVE_POPUP_KEY_LOV')
ORDER BY application_id, page_id;

PROMPT
PROMPT === 7. Session State Protection ===
PROMPT

SELECT 
    application_id,
    page_id,
    item_name,
    session_state_protection,
    'Unprotected item' issue
FROM apex_application_page_items
WHERE session_state_protection IS NULL
  AND display_as_code IN ('NATIVE_HIDDEN', 'NATIVE_DISPLAY_ONLY')
ORDER BY application_id, page_id
FETCH FIRST 50 ROWS ONLY;

PROMPT
PROMPT === 8. Large LOV Definitions ===
PROMPT

SELECT 
    application_id,
    lov_name,
    list_of_values_type,
    LENGTH(list_of_values_query) lov_query_length,
    CASE 
        WHEN list_of_values_query LIKE '%ORDER BY%' THEN 'Has ORDER BY'
        ELSE 'No ORDER BY'
    END sorting_check
FROM apex_application_lovs
WHERE LENGTH(list_of_values_query) > 500
ORDER BY lov_query_length DESC;

PROMPT
PROMPT === 9. Pages with Many Authorizations ===
PROMPT

SELECT 
    application_id,
    page_id,
    COUNT(*) authorization_count
FROM (
    SELECT DISTINCT application_id, page_id, authorization_scheme
    FROM apex_application_page_items
    WHERE authorization_scheme IS NOT NULL
    UNION ALL
    SELECT DISTINCT application_id, page_id, authorization_scheme
    FROM apex_application_page_regions
    WHERE authorization_scheme IS NOT NULL
    UNION ALL
    SELECT DISTINCT application_id, page_id, authorization_scheme
    FROM apex_application_page_buttons
    WHERE authorization_scheme IS NOT NULL
)
GROUP BY application_id, page_id
HAVING COUNT(*) > 10
ORDER BY authorization_count DESC;

PROMPT
PROMPT === 10. Static Files Size Analysis ===
PROMPT

SELECT 
    application_id,
    file_name,
    mime_type,
    ROUND(LENGTH(file_content)/1024, 2) size_kb,
    TO_CHAR(last_updated, 'YYYY-MM-DD HH24:MI:SS') last_updated
FROM apex_application_files
WHERE LENGTH(file_content) > 102400
ORDER BY LENGTH(file_content) DESC;

PROMPT
PROMPT === 11. Workspace Activity - Slow Pages ===
PROMPT

SELECT 
    application_id,
    page_id,
    COUNT(*) access_count,
    ROUND(AVG(elapsed_time), 4) avg_elapsed_time,
    ROUND(MAX(elapsed_time), 4) max_elapsed_time,
    ROUND(MIN(elapsed_time), 4) min_elapsed_time,
    ROUND(STDDEV(elapsed_time), 4) stddev_elapsed_time
FROM apex_workspace_activity_log
WHERE time_stamp > SYSDATE - 7
  AND elapsed_time IS NOT NULL
  AND elapsed_time > 0
GROUP BY application_id, page_id
HAVING AVG(elapsed_time) > 1
ORDER BY avg_elapsed_time DESC;

PROMPT
PROMPT === 12. Applications with Builder Session Issues ===
PROMPT

SELECT 
    application_id,
    page_id,
    'Page locks in builder' issue,
    userid locked_by,
    TO_CHAR(lock_date, 'YYYY-MM-DD HH24:MI:SS') locked_since
FROM apex_application_locks
WHERE lock_type = 'PAGE'
ORDER BY lock_date;

PROMPT
PROMPT === 13. JavaScript Libraries Used ===
PROMPT

SELECT 
    application_id,
    file_name,
    version,
    'JavaScript Library' file_type
FROM apex_application_files
WHERE LOWER(file_name) LIKE '%.js'
  AND LOWER(file_name) NOT LIKE '%min.js'
ORDER BY application_id, file_name;

PROMPT
PROMPT === 14. CSS Files (Check for Minification) ===
PROMPT

SELECT 
    application_id,
    file_name,
    ROUND(LENGTH(file_content)/1024, 2) size_kb,
    CASE 
        WHEN LOWER(file_name) LIKE '%.min.css' THEN 'Minified'
        ELSE 'Not Minified'
    END minification_status
FROM apex_application_files
WHERE LOWER(file_name) LIKE '%.css'
ORDER BY LENGTH(file_content) DESC;

PROMPT
PROMPT === 15. Recommendations Summary ===
PROMPT

SELECT 'Review and optimize complex pages (>50 components)' recommendation FROM dual
UNION ALL
SELECT 'Minimize JavaScript code in Dynamic Actions' FROM dual
UNION ALL
SELECT 'Optimize large SQL queries in regions' FROM dual
UNION ALL
SELECT 'Migrate from legacy components to modern equivalents' FROM dual
UNION ALL
SELECT 'Implement session state protection' FROM dual
UNION ALL
SELECT 'Optimize LOV queries with proper indexing' FROM dual
UNION ALL
SELECT 'Minify JavaScript and CSS files' FROM dual
UNION ALL
SELECT 'Consider splitting complex applications' FROM dual
UNION ALL
SELECT 'Remove or optimize large static files' FROM dual
UNION ALL
SELECT 'Review and reduce authorization checks where possible' FROM dual;

PROMPT
PROMPT ============================================================================
PROMPT End of APEX Metadata Performance Analysis
PROMPT ============================================================================
