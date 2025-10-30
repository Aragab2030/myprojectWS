# Quick Reference - Oracle APEX Page Designer Performance Optimization

## Quick Wins (5 minutes each)

### 1. Enable Compression
**ORDS:** Add to `ords-config-optimization.properties`:
```properties
server.compressResponse=true
```

**Tomcat:** In `server.xml`, add to Connector:
```xml
compression="on" compressionMinSize="2048"
```

### 2. Increase Connection Pool
**ORDS:** Edit `ords-config-optimization.properties`:
```properties
db.maxPoolSize=50
db.initialPoolSize=10
```

### 3. Enable Static File Caching
**ORDS:** Add to `ords-config-optimization.properties`:
```properties
server.defaultStaticFileCacheControl=public, max-age=86400
```

### 4. Update Database Statistics
**Database:**
```sql
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('APEX_230200');
```

## Critical Settings

### JVM Memory (setenv.sh)
```bash
export CATALINA_OPTS="-Xms4g -Xmx8g -XX:+UseG1GC"
```

### Connection Pool Size Formula
```
maxPoolSize = (concurrent_users * avg_session_minutes / connection_timeout_minutes) + buffer
```

Example: 20 users × 30 min / 60 min = 10 + 10 buffer = 20 minimum

## Performance Monitoring

### Quick Health Check
```bash
./performance-monitoring-scripts.sh all
```

### Find Slow Queries
```sql
@/tmp/find_slow_apex_queries.sql
```

### Bundle Size Check
```bash
./bundle-size-analysis.sh report
```

## Common Issues & Fixes

| Issue | Quick Fix |
|-------|-----------|
| Slow loading | Enable compression, check bundle size |
| Connection timeouts | Increase connection pool size |
| High memory | Increase JVM heap, review queries |
| Slow queries | Update statistics, check indexes |

## Key Metrics to Monitor

- Database query time: < 100ms (95th percentile)
- Connection pool utilization: < 80%
- JVM heap usage: < 75%
- Page load time: < 2 seconds

## File Locations Reference

| Component | Configuration File |
|-----------|-------------------|
| ORDS | `ords-config-optimization.properties` |
| Tomcat JVM | `$CATALINA_HOME/bin/setenv.sh` |
| Tomcat Connector | `$CATALINA_HOME/conf/server.xml` |
| Database | Run `oracle-database-optimizations.sql` |

## Checklist for New Deployments

- [ ] ORDS compression enabled
- [ ] Connection pool sized correctly
- [ ] JVM heap set appropriately
- [ ] Static file caching configured
- [ ] Database statistics current
- [ ] Monitoring scripts in place

## Support

For detailed information, see:
- `PERFORMANCE_OPTIMIZATION_GUIDE.md` - Comprehensive guide
- `tomcat-performance-config.md` - Tomcat details
- `client-side-optimizations.md` - Browser/APEX settings
- `oracle-database-optimizations.sql` - Database scripts
