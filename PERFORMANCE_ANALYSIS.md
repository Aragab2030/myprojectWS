# Oracle APEX Page Designer Performance Optimization Guide

## Overview
This guide addresses performance bottlenecks in Oracle APEX Page Designer with Oracle 23 AI database and ORDS deployed on Apache Tomcat.

## Common Performance Bottlenecks

### 1. Database Layer Issues
- **Stale Statistics**: Outdated table/index statistics lead to poor query plans
- **Missing Indexes**: APEX metadata tables need proper indexing
- **Session Memory**: Insufficient PGA/SGA allocation
- **AWR/ADDM Reports**: Not regularly reviewed for performance insights
- **Locking/Blocking**: Sessions waiting on locks

### 2. ORDS Configuration Issues
- **Connection Pool Size**: Too small for concurrent users
- **Connection Timeouts**: Inadequate timeout settings
- **Statement Caching**: Disabled or insufficient cache size
- **JDBC Driver Version**: Outdated driver with performance bugs
- **Logging Level**: Excessive logging impacts performance

### 3. Tomcat Configuration Issues
- **Heap Memory**: Insufficient JVM heap size
- **Thread Pool**: Too few threads for concurrent requests
- **Connection Pool**: Limited database connections
- **Compression**: Not enabled for static resources
- **Cache Headers**: Missing or incorrect cache directives

### 4. APEX Page Designer Specific Issues
- **Large Page Definitions**: Pages with 100+ items/regions
- **Complex Dynamic Actions**: Excessive client-side JavaScript
- **Image/File Size**: Large static files not optimized
- **Session State**: Too much data in session state
- **Shared Components**: Not properly modularized

### 5. Network Layer Issues
- **Latency**: High network latency between components
- **Bandwidth**: Insufficient bandwidth for large payloads
- **HTTP/2**: Not enabled in Tomcat
- **SSL/TLS Overhead**: Inefficient cipher suites

## Quick Wins (Implement First)

### 1. Gather Fresh Database Statistics
```sql
-- Run as APEX_230200 or FLOWS_FILES owner
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('APEX_230200', degree=>4, estimate_percent=>10);
```

### 2. Increase ORDS Connection Pool
Edit `defaults.xml` or `pool.xml`:
```xml
<entry key="jdbc.MaxLimit">50</entry>
<entry key="jdbc.InitialLimit">10</entry>
```

### 3. Tune Tomcat JVM
Edit `catalina.sh` or `setenv.sh`:
```bash
JAVA_OPTS="-Xms2048m -Xmx4096m -XX:+UseG1GC -XX:MaxGCPauseMillis=200"
```

### 4. Enable HTTP Compression
Edit `server.xml`:
```xml
<Connector compression="on" 
           compressableMimeType="text/html,text/xml,text/css,text/javascript,application/json" 
           compressionMinSize="1024"/>
```

## Diagnostic Scripts

All diagnostic scripts are located in the `/diagnostics` folder:
- `db_performance_check.sql` - Database performance analysis
- `apex_metadata_check.sql` - APEX metadata performance
- `session_diagnostics.sql` - Active session analysis
- `ords_health_check.sh` - ORDS configuration validation
- `tomcat_health_check.sh` - Tomcat performance metrics

## Step-by-Step Optimization Process

### Phase 1: Identify Bottlenecks (Week 1)
1. Run all diagnostic scripts
2. Enable AWR snapshots (1-hour intervals)
3. Monitor ORDS logs for slow queries
4. Profile Page Designer load times in browser DevTools
5. Document baseline performance metrics

### Phase 2: Database Optimizations (Week 1-2)
1. Gather statistics on all APEX schemas
2. Add missing indexes (see `recommended_indexes.sql`)
3. Increase PGA/SGA if needed
4. Implement result cache for common queries
5. Tune SQL queries identified in Phase 1

### Phase 3: ORDS Optimizations (Week 2)
1. Update ORDS to latest version
2. Tune connection pool settings
3. Enable statement caching
4. Configure request logging strategically
5. Update JDBC driver to latest version

### Phase 4: Tomcat Optimizations (Week 2-3)
1. Tune JVM heap and GC settings
2. Increase thread pool size
3. Enable HTTP/2 and compression
4. Configure static resource caching
5. Optimize SSL/TLS configuration

### Phase 5: APEX Application Optimizations (Week 3-4)
1. Refactor large pages (split into smaller pages)
2. Optimize Dynamic Actions
3. Minimize session state usage
4. Use APEX caching features
5. Optimize static file delivery (CDN if possible)

### Phase 6: Validate Improvements (Week 4)
1. Re-run all diagnostic scripts
2. Compare before/after metrics
3. Load test with realistic user scenarios
4. Document lessons learned
5. Create ongoing monitoring plan

## Performance Targets

### Page Designer Load Time
- **Current**: [Measure baseline]
- **Target**: < 3 seconds for initial load
- **Target**: < 1 second for subsequent operations

### Database Response Time
- **Current**: [Measure baseline]
- **Target**: < 100ms for 95th percentile queries
- **Target**: < 500ms for complex metadata queries

### ORDS Throughput
- **Current**: [Measure baseline]
- **Target**: > 100 requests/second
- **Target**: < 50ms connection acquisition time

## Monitoring & Maintenance

### Daily
- Check ORDS logs for errors
- Monitor Tomcat thread utilization
- Review database alert log

### Weekly
- Review AWR reports
- Check connection pool statistics
- Analyze slow query logs

### Monthly
- Gather database statistics
- Review and optimize SQL queries
- Update ORDS/Tomcat configurations as needed
- Capacity planning review

## Tools & Resources

### Monitoring Tools
- Oracle Enterprise Manager (OEM)
- AWR/ADDM Reports
- Apache Tomcat Manager
- Browser DevTools (Network/Performance tabs)

### Useful Commands
```bash
# Check ORDS version
java -jar ords.war version

# Check Tomcat threads
curl http://localhost:8080/manager/status/all

# Database performance
sqlplus / as sysdba @db_performance_check.sql
```

## Getting Help

If performance issues persist after implementing these optimizations:
1. Check Oracle Support (MOS) for known issues
2. Review APEX Community forums
3. Enable detailed tracing (see `tracing_guide.md`)
4. Consider engaging Oracle Support for SR

## Next Steps

1. Run the diagnostic scripts in `/diagnostics` folder
2. Document your baseline metrics in `baseline_metrics.md`
3. Implement Quick Wins first
4. Follow the Step-by-Step Optimization Process
5. Monitor and iterate

---

**Last Updated**: 2025-10-30
**APEX Version**: 23.2 (Oracle 23 AI)
**ORDS Version**: Latest
**Tomcat Version**: Latest
