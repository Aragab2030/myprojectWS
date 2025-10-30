# Oracle APEX Page Designer Performance Optimization Guide

## Executive Summary

This guide provides comprehensive optimization strategies for improving Oracle APEX Page Designer performance in environments running Oracle Database 23ai with ORDS deployed on Apache Tomcat. The optimizations cover database, application server, network, and client-side configurations.

## Table of Contents

1. [Quick Start](#quick-start)
2. [Database Optimizations](#database-optimizations)
3. [ORDS Configuration](#ords-configuration)
4. [Apache Tomcat Optimizations](#apache-tomcat-optimizations)
5. [Client-Side Optimizations](#client-side-optimizations)
6. [Monitoring and Analysis](#monitoring-and-analysis)
7. [Troubleshooting](#troubleshooting)
8. [Best Practices](#best-practices)

## Quick Start

### Immediate Actions (Low Risk)

1. **Enable Compression**
   - Configure ORDS compression (see `ords-config-optimization.properties`)
   - Enable Tomcat compression (see `tomcat-performance-config.md`)

2. **Optimize Connection Pooling**
   - Review and adjust ORDS connection pool settings
   - Monitor active connections vs. available pool size

3. **Enable Static File Caching**
   - Configure browser caching headers
   - Set appropriate cache durations

4. **Database Statistics**
   - Ensure APEX schema statistics are current
   - Run: `EXEC DBMS_STATS.GATHER_SCHEMA_STATS('APEX_230200');`

### Medium-Term Actions

1. **JVM Tuning**
   - Adjust Tomcat JVM heap size
   - Configure garbage collection settings

2. **Database Indexing**
   - Review and optimize indexes on APEX tables
   - Consider automatic indexing (Oracle 23ai feature)

3. **Query Optimization**
   - Identify and optimize slow queries
   - Use bind variables consistently

### Long-Term Actions

1. **Architecture Review**
   - Consider separating static file serving
   - Review network topology
   - Evaluate CDN usage

2. **Application Design**
   - Review application architecture
   - Optimize component usage
   - Minimize unnecessary processes

## Database Optimizations

### Key Areas

1. **Statistics Collection**
   ```sql
   -- Run regularly (weekly or after major changes)
   EXEC DBMS_STATS.GATHER_SCHEMA_STATS('APEX_230200', 
       ESTIMATE_PERCENT => DBMS_STATS.AUTO_SAMPLE_SIZE, 
       CASCADE => TRUE);
   ```

2. **Session Configuration**
   - Increase `OPEN_CURSORS` to 1000+
   - Set `SESSION_CACHED_CURSORS` to 200
   - Optimize `CURSOR_SHARING`

3. **Memory Settings**
   - Adequate PGA for concurrent sessions
   - SGA sized appropriately for workload
   - Consider result cache for frequently accessed data

4. **Index Strategy**
   - Oracle 23ai automatic indexing should be enabled
   - Monitor index usage and remove unused indexes
   - Ensure proper indexes on APEX metadata tables

### Oracle 23ai Specific Features

1. **Automatic Indexing**
   - Leverage automatic indexing for query optimization
   - Monitor automatic indexing recommendations

2. **In-Memory Option** (if licensed)
   - Consider enabling for frequently accessed APEX tables
   - Monitor In-Memory Advisor recommendations

3. **Real-Time SQL Monitoring**
   - Use for identifying slow queries during Page Designer use
   - Review AWR reports regularly

See `oracle-database-optimizations.sql` for detailed SQL scripts.

## ORDS Configuration

### Connection Pooling

Optimal settings depend on:
- Concurrent user count
- Average session duration
- Peak usage patterns

Recommended starting point:
```
db.initialPoolSize=10
db.minPoolSize=5
db.maxPoolSize=50
db.poolIncrement=5
```

### Performance Settings

1. **Compression**
   ```properties
   server.compressResponse=true
   server.compressionThreshold=2048
   ```

2. **Caching Headers**
   ```properties
   server.defaultStaticFileCacheControl=public, max-age=86400
   ```

3. **Session Management**
   ```properties
   session.timeout=3600
   session.maxAge=7200
   ```

4. **Thread Pool**
   ```properties
   server.threadPoolSize=200
   ```

### Logging Optimization

Reduce logging overhead in production:
```properties
logging.level.root=WARN
logging.level.oracle.ords=INFO
```

See `ords-config-optimization.properties` for complete configuration.

## Apache Tomcat Optimizations

### JVM Configuration

#### Heap Size
```
-Xms4g -Xmx8g  (for 8GB+ systems)
-Xms8g -Xmx12g (for 16GB+ systems)
```

#### Garbage Collection
```
-XX:+UseG1GC
-XX:MaxGCPauseMillis=200
```

### Connector Settings

Key parameters:
- `maxThreads`: 300
- `minSpareThreads`: 50
- `acceptCount`: 200
- `maxConnections`: 10000
- `compression`: on
- `compressionMinSize`: 2048

### System-Level Optimizations

1. **File Descriptors**
   - Increase to 65535
   - Update `/etc/security/limits.conf`

2. **TCP/IP Settings**
   - Optimize buffer sizes
   - Configure keep-alive settings
   - Enable TCP fast open

3. **Network Stack**
   - Tune `somaxconn`
   - Optimize `tcp_max_syn_backlog`

See `tomcat-performance-config.md` for detailed configuration.

## Client-Side Optimizations

### Browser Configuration

1. **Hardware Acceleration**
   - Enable in browser settings
   - Verify GPU acceleration

2. **Cache Management**
   - Clear cache regularly
   - Use appropriate cache strategies

3. **Extensions**
   - Disable unnecessary extensions
   - Monitor extension performance impact

### APEX Application Settings

1. **Static File Caching**
   - Set maximum cache duration for static files
   - Enable file versioning

2. **Build Options**
   - Enable minification in production
   - Use compressed resources

3. **Page Design**
   - Minimize component count
   - Optimize region structure
   - Use conditional rendering

### Network Optimizations

1. **HTTP/2**
   - Enable if available
   - Supports multiplexing and server push

2. **Compression**
   - GZIP for text resources
   - Brotli if supported

3. **CDN** (if applicable)
   - Serve static files from CDN
   - Optimize cache headers

See `client-side-optimizations.md` for detailed recommendations.

## Monitoring and Analysis

### Database Monitoring

Use provided SQL scripts:
- `monitor_apex_sessions.sql` - Active session monitoring
- `find_slow_apex_queries.sql` - Slow query identification
- `apex_wait_events.sql` - Wait event analysis
- `session_memory_usage.sql` - Memory usage by session

### Application Server Monitoring

1. **Tomcat**
   - Monitor JVM memory usage
   - Track thread pool utilization
   - Review access logs for slow requests

2. **ORDS**
   - Monitor connection pool status
   - Review ORDS logs for errors
   - Track response times

### Bundle Size Analysis

Run `bundle-size-analysis.sh` to:
- Identify large JavaScript/CSS files
- Check compression effectiveness
- Generate optimization recommendations

### Performance Monitoring Scripts

The `performance-monitoring-scripts.sh` provides:
- Interactive monitoring interface
- Automated performance checks
- Resource usage analysis
- Real-time SQL monitoring

**Usage:**
```bash
chmod +x performance-monitoring-scripts.sh
./performance-monitoring-scripts.sh [option]
```

Options:
- `interactive` - Interactive menu
- `all` - Run all checks
- `sessions` - Monitor APEX sessions
- `queries` - Find slow queries
- `memory` - Check memory usage
- `system` - System resources

## Troubleshooting

### Common Performance Issues

#### 1. Slow Page Designer Loading

**Symptoms:** Long initial load time
**Potential Causes:**
- Large JavaScript bundles
- Missing compression
- Slow database queries
- Network latency

**Solutions:**
- Enable compression
- Optimize bundle size
- Review database statistics
- Check network connectivity

#### 2. Slow Property Updates

**Symptoms:** Delays when changing properties
**Potential Causes:**
- Database lock contention
- Slow update queries
- Session pool exhaustion
- Memory pressure

**Solutions:**
- Review slow queries
- Optimize update statements
- Increase connection pool
- Check memory usage

#### 3. High Memory Usage

**Symptoms:** Out of memory errors, slow performance
**Potential Causes:**
- Insufficient JVM heap
- Memory leaks
- Large result sets
- Connection pool too large

**Solutions:**
- Increase JVM heap size
- Review memory profiles
- Optimize queries
- Adjust connection pool

#### 4. Connection Pool Exhaustion

**Symptoms:** Timeout errors, connection refused
**Potential Causes:**
- Pool size too small
- Sessions not closing
- Long-running queries
- High concurrency

**Solutions:**
- Increase pool size
- Review session timeout
- Optimize queries
- Monitor connection usage

### Diagnostic Steps

1. **Identify Bottleneck**
   ```bash
   ./performance-monitoring-scripts.sh all
   ```

2. **Review Database Performance**
   ```sql
   @/tmp/find_slow_apex_queries.sql
   ```

3. **Analyze Bundle Size**
   ```bash
   ./bundle-size-analysis.sh report
   ```

4. **Check System Resources**
   ```bash
   top
   iostat -x 1
   ```

5. **Review Logs**
   - Tomcat logs: `/opt/tomcat/logs/`
   - ORDS logs: Check ORDS config directory
   - Database alert log

## Best Practices

### Development

1. **Code Organization**
   - Minimize custom JavaScript
   - Use APEX-provided APIs
   - Follow APEX best practices

2. **Query Optimization**
   - Always use bind variables
   - Avoid N+1 query problems
   - Use bulk operations

3. **Component Design**
   - Reuse shared components
   - Minimize component nesting
   - Optimize region structure

### Production

1. **Monitoring**
   - Set up regular monitoring
   - Review performance metrics weekly
   - Automate alerts for issues

2. **Maintenance**
   - Regular database statistics collection
   - Index maintenance
   - Log rotation

3. **Configuration**
   - Review settings quarterly
   - Test changes in non-production
   - Document all changes

### Testing

1. **Performance Testing**
   - Load testing before deployment
   - Baseline performance metrics
   - Regression testing after changes

2. **User Acceptance**
   - Test with realistic data volumes
   - Simulate concurrent users
   - Monitor real user experience

## Performance Targets

### Recommended Metrics

- **Page Load Time**: < 2 seconds
- **Property Update Time**: < 500ms
- **Database Query Time**: < 100ms (95th percentile)
- **Connection Pool Utilization**: < 80%
- **JVM Heap Usage**: < 75%
- **CPU Usage**: < 70% average

### Monitoring Frequency

- **Real-time**: During troubleshooting
- **Daily**: Automated checks
- **Weekly**: Performance reports
- **Monthly**: Comprehensive review

## Additional Resources

### Oracle Documentation

- [Oracle APEX Documentation](https://docs.oracle.com/en/database/oracle/application-express/)
- [ORDS Configuration Guide](https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/)
- [Oracle Database Performance Tuning Guide](https://docs.oracle.com/en/database/oracle/oracle-database/23/tgdba/)

### Oracle 23ai Specific

- Oracle Database 23ai New Features
- Automatic Indexing Guide
- Real-Time SQL Monitoring
- In-Memory Database Guide

## Implementation Checklist

### Database
- [ ] Review and apply database optimizations
- [ ] Gather current statistics
- [ ] Verify indexes are appropriate
- [ ] Configure session parameters
- [ ] Set up AWR snapshots

### ORDS
- [ ] Review connection pool settings
- [ ] Enable compression
- [ ] Configure caching headers
- [ ] Optimize logging
- [ ] Test configuration changes

### Tomcat
- [ ] Configure JVM settings
- [ ] Optimize connector settings
- [ ] Configure thread pools
- [ ] Set up system-level optimizations
- [ ] Enable monitoring

### Client-Side
- [ ] Review application settings
- [ ] Enable static file caching
- [ ] Optimize build options
- [ ] Review component structure
- [ ] Test browser performance

### Monitoring
- [ ] Set up monitoring scripts
- [ ] Configure automated checks
- [ ] Create performance baselines
- [ ] Set up alerting
- [ ] Document procedures

## Conclusion

Performance optimization is an ongoing process. Regular monitoring, analysis, and adjustments are necessary to maintain optimal performance. Start with the quick wins, establish baselines, and iteratively improve based on monitoring data.

For specific issues, refer to the troubleshooting section or consult Oracle support with detailed performance metrics and diagnostic information.

---

**Last Updated:** October 2024  
**Version:** 1.0  
**Compatible With:** Oracle Database 23ai, Oracle APEX 23.2, ORDS Latest, Apache Tomcat 9.x/10.x
