# Configuration Templates

This directory contains optimized configuration templates for ORDS and Apache Tomcat to improve Oracle APEX Page Designer performance.

## Files Overview

### 1. `ords-defaults.xml`
**Purpose**: Optimized ORDS connection pool and request handling configuration

**Key Settings**:
- Connection pool sizing
- Statement caching
- Request timeouts
- Compression settings
- APEX-specific optimizations

**How to Use**:
```bash
# 1. Backup current configuration
cp $ORDS_CONFIG/databases/default/pool.xml $ORDS_CONFIG/databases/default/pool.xml.backup

# 2. Copy template
cp ords-defaults.xml $ORDS_CONFIG/databases/default/pool.xml

# 3. Edit values for your environment
vi $ORDS_CONFIG/databases/default/pool.xml

# 4. Key values to customize:
#    - jdbc.MaxLimit (based on concurrent users)
#    - jdbc.InitialLimit (10-20% of MaxLimit)
#    - Connection timeouts (based on network)

# 5. Restart ORDS
# (Method depends on your deployment)
```

**Critical Parameters to Adjust**:
```xml
<!-- Adjust based on expected concurrent users -->
<entry key="jdbc.MaxLimit">100</entry>

<!-- Initial connections on startup -->
<entry key="jdbc.InitialLimit">10</entry>

<!-- Connection timeout in seconds -->
<entry key="jdbc.ConnectionTimeout">30</entry>
```

### 2. `tomcat-server.xml`
**Purpose**: Optimized Apache Tomcat connector and host configuration

**Key Settings**:
- Thread pool sizing
- HTTP compression
- Connection management
- SSL/TLS optimization
- HTTP/2 support (commented out)

**How to Use**:
```bash
# 1. Backup current configuration
cp $CATALINA_HOME/conf/server.xml $CATALINA_HOME/conf/server.xml.backup

# 2. Merge with existing server.xml
# DO NOT replace entire file - merge specific Connector settings

# 3. Key sections to update in your server.xml:
#    - Connector settings (port 8080)
#    - SSL Connector (port 8443) if using HTTPS
#    - Host context settings

# 4. Restart Tomcat
$CATALINA_HOME/bin/shutdown.sh
$CATALINA_HOME/bin/startup.sh
```

**Critical Parameters to Adjust**:
```xml
<!-- Adjust based on CPU cores and expected load -->
<Connector port="8080"
           maxThreads="200"           <!-- 200-400 for production -->
           minSpareThreads="25"       <!-- 10-15% of maxThreads -->
           maxConnections="8192"      <!-- 4-8x maxThreads -->
           compression="on"           <!-- Keep enabled -->
           maxPostSize="20971520"     <!-- 20MB for APEX -->
           />
```

### 3. `jvm-tuning.sh`
**Purpose**: Comprehensive JVM memory and garbage collection tuning for Tomcat

**Key Settings**:
- Heap memory sizing
- Garbage collection algorithm (G1GC)
- JIT compiler optimization
- Network tuning
- ORDS-specific JDBC settings

**How to Use**:
```bash
# 1. Backup existing setenv.sh (if it exists)
[ -f $CATALINA_HOME/bin/setenv.sh ] && \
  cp $CATALINA_HOME/bin/setenv.sh $CATALINA_HOME/bin/setenv.sh.backup

# 2. Copy template
cp jvm-tuning.sh $CATALINA_HOME/bin/setenv.sh

# 3. Make executable
chmod +x $CATALINA_HOME/bin/setenv.sh

# 4. Edit memory values based on available RAM
vi $CATALINA_HOME/bin/setenv.sh

# 5. Key values to customize:
#    MIN_HEAP="4096m"      # Adjust based on available RAM
#    MAX_HEAP="8192m"      # 25-50% of system RAM
#    METASPACE_SIZE="512m" # Usually 256-512m is sufficient

# 6. Restart Tomcat
$CATALINA_HOME/bin/shutdown.sh
$CATALINA_HOME/bin/startup.sh

# 7. Verify settings
ps aux | grep catalina | grep Xmx
```

**Memory Sizing Guidelines**:

| System RAM | Heap Size | Recommendation |
|------------|-----------|----------------|
| 8 GB | 2-3 GB | Small deployment |
| 16 GB | 4-6 GB | Medium deployment |
| 32 GB | 8-12 GB | Large deployment |
| 64+ GB | 16-24 GB | Enterprise deployment |

**Leave 25-50% of RAM for OS and other processes!**

## Configuration Workflow

### Step 1: Assess Current State
```bash
# Check current ORDS settings
cat $ORDS_CONFIG/databases/default/pool.xml | grep -E "jdbc.MaxLimit|jdbc.InitialLimit"

# Check current Tomcat connector
cat $CATALINA_HOME/conf/server.xml | grep -A 10 "Connector port=\"8080\""

# Check current JVM settings
ps aux | grep catalina | grep -o "\-Xm[sx][^ ]*"
```

### Step 2: Document Baselines
```bash
# Create baseline report
cat > /tmp/baseline.txt << EOF
Date: $(date)
ORDS MaxLimit: $(grep jdbc.MaxLimit $ORDS_CONFIG/databases/default/pool.xml)
Tomcat maxThreads: $(grep maxThreads $CATALINA_HOME/conf/server.xml | head -1)
JVM Heap: $(ps aux | grep catalina | grep -o "\-Xmx[^ ]*")
EOF
```

### Step 3: Apply Configurations

#### A. Update ORDS (No Restart Required for Some Settings)
```bash
# Backup
cp $ORDS_CONFIG/databases/default/pool.xml \
   $ORDS_CONFIG/databases/default/pool.xml.$(date +%Y%m%d)

# Update (edit values in template first)
cp ords-defaults.xml $ORDS_CONFIG/databases/default/pool.xml

# Note: Some ORDS settings require restart
```

#### B. Update Tomcat (Requires Restart)
```bash
# Backup
cp $CATALINA_HOME/conf/server.xml \
   $CATALINA_HOME/conf/server.xml.$(date +%Y%m%d)

# Merge settings from tomcat-server.xml template
# (Don't replace entire file - merge Connector sections)

# Backup and update setenv.sh
cp jvm-tuning.sh $CATALINA_HOME/bin/setenv.sh
chmod +x $CATALINA_HOME/bin/setenv.sh

# Edit memory values
vi $CATALINA_HOME/bin/setenv.sh
```

### Step 4: Restart Services
```bash
# Restart Tomcat (ORDS restarts with Tomcat)
$CATALINA_HOME/bin/shutdown.sh

# Wait for clean shutdown (30 seconds)
sleep 30

# Force kill if needed
# pkill -9 -f catalina

# Start Tomcat
$CATALINA_HOME/bin/startup.sh

# Monitor startup
tail -f $CATALINA_HOME/logs/catalina.out
```

### Step 5: Verify Changes
```bash
# Check JVM settings
ps aux | grep catalina | grep -E "Xms|Xmx|UseG1GC"

# Check Tomcat is running
curl -I http://localhost:8080/

# Check ORDS is accessible
curl -I http://localhost:8080/ords/

# Monitor logs for errors
tail -100 $CATALINA_HOME/logs/catalina.out | grep -i error
```

### Step 6: Monitor Performance
```bash
# Watch GC logs
tail -f $CATALINA_HOME/logs/gc.log

# Monitor threads
jstack $(pgrep -f catalina) | grep "java.lang.Thread.State" | sort | uniq -c

# Monitor heap usage
jstat -gc $(pgrep -f catalina) 1000

# Watch connections
watch -n 5 'netstat -an | grep :8080 | wc -l'
```

## Tuning Guidelines

### ORDS Connection Pool

#### When to Increase `jdbc.MaxLimit`:
- Seeing "connection wait" in ORDS logs
- Many concurrent users (> 50)
- High connection pool utilization

#### Formula:
```
MaxLimit = (Expected Concurrent Users × 1.5) + 10
```

Example:
- 50 concurrent users → MaxLimit = 85
- 100 concurrent users → MaxLimit = 160

**Warning**: Don't exceed database `processes` parameter!

Check database limit:
```sql
SELECT value FROM v$parameter WHERE name = 'processes';
-- ORDS should use < 50% of this value
```

### Tomcat Threads

#### Formula:
```
maxThreads = Number of CPU Cores × 200
```

Example:
- 4 CPU cores → maxThreads = 800 (but 200-400 is usually sufficient)
- 8 CPU cores → maxThreads = 1600 (but 400-800 is usually sufficient)

**Balance with ORDS**:
```
Tomcat maxThreads ≈ ORDS jdbc.MaxLimit × 2
```

### JVM Heap

#### Guidelines:
```
Xms = Xmx (equal values for consistent performance)
Xmx = 25-50% of System RAM
Metaspace = 256-512m (usually sufficient)
```

#### Warning Signs:
- **OutOfMemoryError**: Increase heap
- **Frequent Full GC**: Increase heap or optimize application
- **Long GC pauses**: Tune G1GC parameters
- **High metaspace**: Increase MaxMetaspaceSize

## Testing Changes

### Load Testing

#### Simple Test with curl
```bash
# Test single request time
time curl -s http://localhost:8080/ords/f?p=APP_ID:1

# Test concurrent requests (requires GNU parallel)
seq 1 50 | parallel -j 50 \
  'curl -s -o /dev/null -w "Time: %{time_total}s\n" \
   http://localhost:8080/ords/f?p=APP_ID:1'
```

#### Apache JMeter Test
```bash
# Create JMeter test plan
# 1. Add Thread Group (50 users, 10 second ramp-up, 5 loops)
# 2. Add HTTP Request (localhost:8080, /ords/f?p=APP_ID:1)
# 3. Add Listeners (View Results Tree, Summary Report)
# 4. Run test

jmeter -n -t test_plan.jmx -l results.jtl -e -o report/
```

### Monitor During Test
```bash
# Terminal 1: Watch logs
tail -f $CATALINA_HOME/logs/catalina.out

# Terminal 2: Monitor JVM
watch -n 2 'jstat -gc $(pgrep -f catalina)'

# Terminal 3: Monitor connections
watch -n 2 'netstat -an | grep :8080 | wc -l'

# Terminal 4: Monitor database
sqlplus user/pass@db << EOF
SELECT COUNT(*) FROM v$session WHERE program LIKE '%ORDS%';
EXIT;
EOF
```

## Rollback Procedure

### If Performance Gets Worse

#### Rollback ORDS Config
```bash
cp $ORDS_CONFIG/databases/default/pool.xml.backup \
   $ORDS_CONFIG/databases/default/pool.xml
# Restart ORDS
```

#### Rollback Tomcat Config
```bash
cp $CATALINA_HOME/conf/server.xml.backup \
   $CATALINA_HOME/conf/server.xml
   
cp $CATALINA_HOME/bin/setenv.sh.backup \
   $CATALINA_HOME/bin/setenv.sh
   
# Restart Tomcat
$CATALINA_HOME/bin/shutdown.sh
sleep 30
$CATALINA_HOME/bin/startup.sh
```

## Common Issues

### Issue: OutOfMemoryError

**Symptoms**:
```
java.lang.OutOfMemoryError: Java heap space
```

**Solutions**:
1. Increase `-Xmx` value
2. Analyze heap dump for memory leaks
3. Reduce connection pool sizes
4. Optimize APEX session state

### Issue: Too Many Threads

**Symptoms**:
```
java.lang.OutOfMemoryError: unable to create new native thread
```

**Solutions**:
1. Decrease `maxThreads` in server.xml
2. Increase OS thread limit: `ulimit -u`
3. Check for thread leaks

### Issue: Connection Pool Exhausted

**Symptoms**:
```
[ERROR] Could not get a connection from the pool
```

**Solutions**:
1. Increase `jdbc.MaxLimit`
2. Decrease `jdbc.InactivityTimeout`
3. Check for connection leaks
4. Verify database `processes` parameter

### Issue: Slow GC

**Symptoms**:
- Long pause times in gc.log
- Application freezes periodically

**Solutions**:
1. Increase heap size
2. Tune G1GC parameters:
   ```
   -XX:MaxGCPauseMillis=200
   -XX:InitiatingHeapOccupancyPercent=45
   ```
3. Consider ZGC (Java 11+) for ultra-low latency

## Best Practices

1. ✅ **Test in Non-Production First**: Always test configuration changes in dev/test
2. ✅ **Make Incremental Changes**: Change one thing at a time
3. ✅ **Backup Before Changes**: Always backup configuration files
4. ✅ **Monitor After Changes**: Watch logs and metrics for 24-48 hours
5. ✅ **Document Changes**: Keep a change log
6. ✅ **Use Version Control**: Store configs in Git
7. ✅ **Schedule Maintenance Window**: Plan restarts during low-usage periods
8. ✅ **Have Rollback Plan**: Know how to revert quickly

## Additional Resources

- **ORDS Documentation**: https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/
- **Tomcat Documentation**: https://tomcat.apache.org/tomcat-9.0-doc/
- **Java GC Tuning**: https://docs.oracle.com/en/java/javase/11/gctuning/
- **APEX Documentation**: https://docs.oracle.com/en/database/oracle/apex/

---

**Last Updated**: 2025-10-30
**Version**: 1.0
**Tested With**: Oracle 23 AI, APEX 23.2, ORDS Latest, Tomcat 9.0
