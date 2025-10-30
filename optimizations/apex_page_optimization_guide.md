# APEX Page Designer Optimization Guide

## Overview
This guide provides specific techniques to optimize individual APEX applications and pages for better Page Designer performance.

## 1. Page Complexity Reduction

### Identify Complex Pages
Complex pages (> 50 items/regions) slow down Page Designer:

```sql
-- Find your most complex pages
SELECT 
    application_id,
    page_id,
    page_name,
    (SELECT COUNT(*) FROM apex_application_page_items i 
     WHERE i.application_id = p.application_id AND i.page_id = p.page_id) items,
    (SELECT COUNT(*) FROM apex_application_page_regions r 
     WHERE r.application_id = p.application_id AND r.page_id = p.page_id) regions
FROM apex_application_pages p
WHERE application_id = &APP_ID
ORDER BY items + regions DESC;
```

### Optimization Strategies

#### A. Split Complex Pages
- Break large forms into wizard-style multi-page flows
- Use modal dialogs for secondary information
- Implement master-detail relationships across pages

#### B. Reduce Items
- Convert display-only items to region source columns
- Use SQL expressions instead of computed items where possible
- Remove unused or deprecated items

#### C. Optimize Regions
- Combine multiple regions with similar queries
- Use sub-regions instead of separate regions
- Convert static content regions to templates

## 2. Dynamic Actions Optimization

### Audit Dynamic Actions
```sql
-- Find pages with many dynamic actions
SELECT 
    application_id,
    page_id,
    COUNT(*) da_count,
    SUM(LENGTH(action_code)) total_js_length
FROM apex_application_page_da_acts
WHERE application_id = &APP_ID
GROUP BY application_id, page_id
HAVING COUNT(*) > 20
ORDER BY da_count DESC;
```

### Best Practices

#### A. Minimize JavaScript
- Use APEX built-in functionality instead of custom JS
- Externalize large JavaScript code into application files
- Minify all JavaScript code
- Use JavaScript promises for async operations

#### B. Consolidate Events
- Combine multiple Dynamic Actions on same event
- Use event delegation for repeated elements
- Avoid redundant true/false action branches

#### C. Performance Tips
```javascript
// BAD: Querying DOM multiple times
apex.item('P1_ITEM1').setValue('value1');
apex.item('P1_ITEM2').setValue('value2');
apex.item('P1_ITEM3').setValue('value3');

// GOOD: Batch operations
apex.page.submit({
    set: {
        'P1_ITEM1': 'value1',
        'P1_ITEM2': 'value2',
        'P1_ITEM3': 'value3'
    }
});

// BAD: Multiple AJAX calls
apex.server.process('PROCESS1', {}, {...});
apex.server.process('PROCESS2', {}, {...});

// GOOD: Single AJAX call handling multiple operations
apex.server.process('BATCH_PROCESS', {
    operation: 'multiple',
    items: ['item1', 'item2']
}, {...});
```

## 3. Query Optimization

### Identify Slow Queries
```sql
-- Find regions with potentially slow queries
SELECT 
    application_id,
    page_id,
    region_name,
    LENGTH(region_source) query_length
FROM apex_application_page_regions
WHERE application_id = &APP_ID
  AND source_type LIKE '%SQL%'
  AND LENGTH(region_source) > 1000
ORDER BY query_length DESC;
```

### Optimization Techniques

#### A. Use Bind Variables
```sql
-- BAD: String concatenation
SELECT * FROM employees WHERE department_id = :P1_DEPT_ID || ''

-- GOOD: Direct bind
SELECT * FROM employees WHERE department_id = :P1_DEPT_ID
```

#### B. Limit Result Sets
```sql
-- Add proper WHERE clauses
SELECT * FROM large_table
WHERE created_date > SYSDATE - 30  -- Limit to recent data
  AND ROWNUM <= 1000;              -- Cap maximum rows
```

#### C. Use Appropriate Joins
```sql
-- Prefer ANSI joins for clarity
SELECT e.*, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.active_flag = 'Y';
```

## 4. Session State Optimization

### Minimize Session State
```sql
-- Check session state size by page
SELECT 
    page_id,
    COUNT(*) item_count,
    SUM(LENGTH(item_value)) total_size
FROM apex_session_state
WHERE application_id = &APP_ID
  AND session_id = :APP_SESSION
GROUP BY page_id
ORDER BY total_size DESC;
```

### Best Practices

#### A. Clear Unused Session State
- Use "Clear Cache" appropriately in branches/buttons
- Set items to "Session State Protected" when appropriate
- Use page-level cache settings

#### B. Reduce Session State Storage
```sql
-- In page processes or application initialization
-- Clear session state for items no longer needed
apex_util.clear_page_cache(p_page => :APP_PAGE_ID);

-- Clear specific items
apex_util.set_session_state(
    p_name  => 'P1_TEMP_ITEM',
    p_value => NULL
);
```

## 5. List of Values (LOV) Optimization

### Audit LOV Performance
```sql
-- Find LOVs with complex queries
SELECT 
    lov_name,
    list_of_values_type,
    LENGTH(list_of_values_query) query_length
FROM apex_application_lovs
WHERE application_id = &APP_ID
  AND LENGTH(list_of_values_query) > 500
ORDER BY query_length DESC;
```

### Optimization Strategies

#### A. Use Static LOVs
- Convert dynamic LOVs to static if data rarely changes
- Use shared components for reusable LOVs
- Cache LOV results at application level

#### B. Optimize Dynamic LOVs
```sql
-- BAD: No display value caching
SELECT id, expensive_function(name) display_value
FROM large_table
ORDER BY display_value;

-- GOOD: Materialized or cached results
SELECT id, cached_display_value
FROM large_table_mv
WHERE active = 'Y'
ORDER BY cached_display_value;
```

#### C. Use Cascading LOVs Efficiently
- Limit parent LOV size
- Add proper indexes on relationship columns
- Use page caching for parent values

## 6. Static File Optimization

### Audit Static Files
```sql
-- Find large static files
SELECT 
    application_id,
    file_name,
    mime_type,
    ROUND(LENGTH(file_content)/1024, 2) size_kb,
    last_updated
FROM apex_application_files
WHERE application_id = &APP_ID
  AND LENGTH(file_content) > 51200  -- > 50KB
ORDER BY LENGTH(file_content) DESC;
```

### Optimization Steps

#### A. Image Optimization
- Compress images (use tools like TinyPNG, ImageOptim)
- Use appropriate formats (WebP for photos, SVG for icons)
- Implement lazy loading for images
- Consider using image CDN

#### B. JavaScript/CSS Optimization
```bash
# Minify JavaScript
uglifyjs application.js -o application.min.js

# Minify CSS
cleancss -o application.min.css application.css

# Combine files to reduce HTTP requests
cat file1.js file2.js file3.js | uglifyjs > combined.min.js
```

#### C. Use External CDN
```javascript
// Instead of uploading to APEX
// Use CDN for common libraries
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
```

## 7. Application-Level Caching

### Enable Region Caching
In APEX Page Designer:
1. Navigate to region > Advanced
2. Set "Caching" to appropriate option
3. Define cache timeout
4. Set cache conditions

### Implementation Example
```sql
-- Region Query with caching consideration
SELECT /*+ RESULT_CACHE */
    employee_id,
    first_name,
    last_name,
    department_name
FROM v_employee_details
WHERE status = 'ACTIVE';
```

### Cache Management
```sql
-- Clear specific region cache
apex_util.clear_page_cache(
    p_page_id => 1,
    p_clear_regions => TRUE
);

-- Clear all application cache
apex_util.clear_app_cache(p_app_id => &APP_ID);
```

## 8. Lazy Loading Implementation

### For Regions
```javascript
// Load region content only when needed
apex.region('my_region').refresh();
```

### For Tabs/Accordions
- Use Dynamic Actions to load content on tab change
- Initialize only the first tab/panel
- Load others on demand

### Example Dynamic Action
```javascript
// When tab is clicked
apex.server.process('LOAD_TAB_DATA', {
    x01: tabIndex
}, {
    success: function(data) {
        apex.region('tabRegion').refresh();
    },
    loadingIndicator: apex.util.showSpinner()
});
```

## 9. Template Optimization

### Use Efficient Templates
- Minimize CSS/JavaScript in templates
- Use template options instead of custom CSS
- Leverage Universal Theme features

### Custom Template Best Practices
```html
<!-- BAD: Inline styles and scripts -->
<div style="color: red;" onclick="myFunction()">Content</div>

<!-- GOOD: Use classes and APEX functionality -->
<div class="custom-red" data-action="click">Content</div>
```

## 10. Testing and Monitoring

### Performance Testing Checklist
- [ ] Test with realistic data volumes
- [ ] Use browser DevTools Network tab
- [ ] Monitor database SQL execution
- [ ] Check APEX Debug mode
- [ ] Test with multiple concurrent users

### Browser DevTools Metrics
1. **Load Time**: Target < 3 seconds
2. **DOM Content Loaded**: Target < 1.5 seconds
3. **JavaScript Execution**: Target < 500ms
4. **API Calls**: Minimize count, optimize size

### APEX Debug Mode
Enable debug in URL:
```
?debug=YES
```

Review debug output for:
- Slow region rendering
- Excessive validations
- Redundant processes
- Large session state

## 11. Quick Wins Checklist

### Immediate Actions
- [ ] Remove unused items and regions
- [ ] Combine similar queries
- [ ] Enable region caching where appropriate
- [ ] Minify JavaScript and CSS files
- [ ] Optimize images
- [ ] Add proper WHERE clauses to queries
- [ ] Clear session state regularly
- [ ] Use built-in APEX features vs custom code
- [ ] Limit items per page (< 50)
- [ ] Set session state protection

### Weekly Maintenance
- [ ] Review slow page logs
- [ ] Update statistics on app tables
- [ ] Clean up old collections
- [ ] Review and optimize new SQL
- [ ] Test page load times

### Monthly Review
- [ ] Analyze user activity patterns
- [ ] Review AWR reports
- [ ] Update indexes as needed
- [ ] Refactor complex pages
- [ ] Update APEX version if available

## 12. Common Anti-Patterns to Avoid

### ❌ Don't Do This
1. **Excessive Page Items**: > 100 items on one page
2. **No Query Filters**: SELECT * FROM huge_table
3. **Inline JavaScript**: Mixing code with markup
4. **Synchronous Processing**: Blocking UI during operations
5. **No Error Handling**: Unhandled AJAX errors
6. **Poor Naming**: Items named "TEXT1", "TEXT2"
7. **Hardcoded Values**: Not using substitution strings
8. **No Comments**: Undocumented complex logic

### ✅ Do This Instead
1. **Modular Pages**: Split into logical units
2. **Filtered Queries**: Always use WHERE clauses
3. **External Files**: Separate JavaScript files
4. **Async Operations**: Use promises and callbacks
5. **Graceful Degradation**: Handle errors properly
6. **Descriptive Names**: P1_CUSTOMER_NAME
7. **Application Items**: Centralized configuration
8. **Documentation**: Comment complex logic

## 13. Performance Budget

Set and track performance budgets:

| Metric | Target | Maximum |
|--------|--------|---------|
| Page Load Time | < 2s | < 3s |
| Time to Interactive | < 3s | < 5s |
| Total Page Size | < 1MB | < 2MB |
| JavaScript Size | < 200KB | < 500KB |
| CSS Size | < 50KB | < 100KB |
| Images Total | < 500KB | < 1MB |
| API Calls | < 5 | < 10 |
| Database Queries | < 10 | < 20 |

## Additional Resources

- **APEX Documentation**: https://docs.oracle.com/en/database/oracle/apex/
- **APEX Community**: https://community.oracle.com/apex
- **Performance Tuning Guide**: Oracle APEX Application Development Guide
- **SQL Tuning**: Oracle Database SQL Tuning Guide

---

**Remember**: Performance optimization is iterative. Start with the biggest bottlenecks and measure improvements after each change.
