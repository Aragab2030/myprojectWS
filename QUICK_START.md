# Quick Start Guide - APEX Performance Optimization

## 🚀 Immediate Actions (Do This First!)

### 1. Run Diagnostic Scripts (15 minutes)

#### Database Performance Check
```bash
cd diagnostics
sqlplus your_user/your_password@your_db @db_performance_check.sql > ../reports/db_performance_$(date +%Y%m%d).txt
```

#### APEX Metadata Check
```bash
sqlplus your_user/your_password@your_db @apex_metadata_check.sql > ../reports/apex_metadata_$(date +%Y%m%d).txt
```

#### Session Diagnostics
```bash
sqlplus your_user/your_password@your_db @session_diagnostics.sql > ../reports/session_diag_$(date +%Y%m%d).txt
```

### 2. Review Results
Look for these red flags:
- ❌ Statistics older than 7 days
- ❌ Blocking sessions
- ❌ Pages with > 50 components
- ❌ Queries taking > 1 second
- ❌ High memory/CPU usage

### 3. Apply Quick Wins (30 minutes)

#### A. Gather Fresh Statistics
```sql
sqlplus / as sysdba
SQL> @optimizations/apex_performance_optimization.sql
```

#### B. Update ORDS Configuration
```bash
# Backup current config
cp $ORDS_CONFIG/defaults.xml $ORDS_CONFIG/defaults.xml.backup

# Copy optimized config
cp config-templates/ords-defaults.xml $ORDS_CONFIG/defaults.xml

# Edit with your values
vi $ORDS_CONFIG/defaults.xml

# Restart ORDS
```

#### C. Tune Tomcat JVM
```bash
# Backup current config
cp $CATALINA_HOME/bin/setenv.sh $CATALINA_HOME/bin/setenv.sh.backup

# Copy optimized config
cp config-templates/jvm-tuning.sh $CATALINA_HOME/bin/setenv.sh

# Adjust memory values based on your system
vi $CATALINA_HOME/bin/setenv.sh

# Restart Tomcat
$CATALINA_HOME/bin/shutdown.sh
$CATALINA_HOME/bin/startup.sh
```

## 📊 Monitoring Setup (15 minutes)

### Start Automated Monitoring
```bash
cd diagnostics

# Basic monitoring (no database checks)
./automated_monitoring.sh -i 300 -o ../monitoring_output

# Full monitoring (with database)
./automated_monitoring.sh -i 300 -o ../monitoring_output \
  -d your_db_tns -u your_user -t /opt/tomcat
```

### Monitor in Real-Time
```bash
# Watch the log
tail -f monitoring_output/monitoring_*.log

# Check latest summary
cat monitoring_output/summary_*.txt | tail -20
```

## 🔍 Baseline Performance

### Before Optimization
Record these metrics:

```bash
# Create reports directory
mkdir -p reports

# Page Designer Load Time
# 1. Open browser DevTools (F12)
# 2. Navigate to APEX Page Designer
# 3. Record "Load" time in Network tab
echo "Page Designer Load Time: ___ seconds" > reports/baseline.txt

# Database Response Time
# Run this query 5 times and record average
sqlplus your_user/your_password@your_db << EOF
SET TIMING ON
SELECT COUNT(*) FROM apex_application_page_items;
EXIT;
EOF
```

### After Optimization
Repeat the same tests and compare!

## 🎯 Priority Matrix

### High Impact, Low Effort (Do First)
1. ✅ Gather database statistics
2. ✅ Increase ORDS connection pool
3. ✅ Tune Tomcat JVM memory
4. ✅ Enable HTTP compression
5. ✅ Clear old session state

### High Impact, Medium Effort (Do This Week)
1. 📝 Optimize slow SQL queries
2. 📝 Add missing indexes
3. 📝 Simplify complex pages
4. 📝 Minimize Dynamic Actions
5. 📝 Implement result caching

### Medium Impact, High Effort (Do This Month)
1. 📅 Refactor complex applications
2. 📅 Migrate to Universal Theme
3. 📅 Implement CDN for static files
4. 📅 Set up read replicas
5. 📅 Application redesign

## 🏆 Success Metrics

### Target Performance
- Page Designer Load: < 3 seconds
- Page Render: < 2 seconds
- AJAX Requests: < 500ms
- Database Queries: < 100ms (95th percentile)
- Connection Pool Wait: < 50ms

### Monitor These
```sql
-- Daily Health Check (5 minutes)
SELECT 
    'APEX Sessions' metric,
    COUNT(*) value
FROM apex_workspace_activity_log
WHERE time_stamp > SYSDATE - 1/24
UNION ALL
SELECT 
    'Active DB Sessions',
    COUNT(*)
FROM v$session
WHERE status = 'ACTIVE' AND username IS NOT NULL
UNION ALL
SELECT
    'Blocking Sessions',
    COUNT(*)
FROM v$session
WHERE blocking_session IS NOT NULL;
```

## 🆘 Troubleshooting

### Page Designer Still Slow?

#### Check 1: Database
```sql
-- Are statistics current?
SELECT MAX(last_analyzed) FROM dba_tables WHERE owner LIKE 'APEX_%';
-- Should be within last 7 days

-- Any blocking?
SELECT COUNT(*) FROM v$session WHERE blocking_session IS NOT NULL;
-- Should be 0
```

#### Check 2: ORDS
```bash
# Check ORDS logs
tail -100 $ORDS_HOME/logs/ords.log | grep -i "error\|exception"

# Check connection pool
# Look for "connection wait" messages
```

#### Check 3: Tomcat
```bash
# Check heap usage
jstat -gc $(pgrep -f catalina) 1000 5

# Check thread count
jstack $(pgrep -f catalina) | grep "java.lang.Thread.State" | wc -l

# Should be < 200 threads
```

#### Check 4: Network
```bash
# Test latency
ping -c 10 your_database_host

# Test bandwidth
# Download a large file from ORDS
time curl -o /dev/null http://localhost:8080/ords/some/large/file
```

### Common Issues

| Symptom | Likely Cause | Solution |
|---------|--------------|----------|
| Slow initial load | Large metadata | Split complex pages |
| Slow every load | Database performance | Optimize SQL, add indexes |
| Timeout errors | Connection pool | Increase jdbc.MaxLimit |
| Out of memory | JVM heap size | Increase -Xmx value |
| High CPU | Inefficient queries | Review AWR, optimize SQL |
| Connection refused | ORDS down | Check ORDS logs, restart |

## 📞 Getting Help

### Gather This Information
```bash
# System info
uname -a > /tmp/help_info.txt
free -h >> /tmp/help_info.txt

# APEX version
echo "SELECT * FROM apex_release;" | sqlplus -s user/pass@db >> /tmp/help_info.txt

# ORDS version
java -jar ords.war version >> /tmp/help_info.txt

# Java version
java -version >> /tmp/help_info.txt 2>&1

# Tomcat version
$CATALINA_HOME/bin/version.sh >> /tmp/help_info.txt

# Recent errors
grep -i error $CATALINA_HOME/logs/catalina.out | tail -50 >> /tmp/help_info.txt
```

### Resources
- **Oracle Support**: https://support.oracle.com
- **APEX Community**: https://community.oracle.com/apex
- **Stack Overflow**: https://stackoverflow.com/questions/tagged/oracle-apex
- **Documentation**: See `PERFORMANCE_ANALYSIS.md`

## 📋 Checklist

### Initial Setup
- [ ] Run diagnostic scripts
- [ ] Document baseline performance
- [ ] Identify top 3 bottlenecks
- [ ] Apply quick wins
- [ ] Restart services
- [ ] Re-test performance

### Daily Tasks
- [ ] Check monitoring logs
- [ ] Review error logs
- [ ] Clear old session state
- [ ] Monitor connection pool

### Weekly Tasks
- [ ] Review AWR reports
- [ ] Gather database statistics
- [ ] Analyze slow queries
- [ ] Check disk space
- [ ] Update performance metrics

### Monthly Tasks
- [ ] Review architecture
- [ ] Plan optimizations
- [ ] Update indexes
- [ ] Capacity planning
- [ ] Document changes

## 🎓 Next Steps

1. **Read**: `PERFORMANCE_ANALYSIS.md` for detailed information
2. **Implement**: Priority optimizations from diagnostic reports
3. **Monitor**: Set up automated monitoring
4. **Iterate**: Continuously measure and improve
5. **Document**: Keep notes on what works

## 💡 Pro Tips

1. **Test in Non-Production First**: Always test changes in dev/test environment
2. **One Change at a Time**: Make incremental changes to measure impact
3. **Backup Everything**: Before modifying configs, create backups
4. **Monitor Continuously**: Set up alerts for critical thresholds
5. **Document Changes**: Keep a log of all optimizations applied
6. **Review Regularly**: Performance tuning is ongoing, not one-time
7. **Learn from Data**: Use metrics to guide optimization efforts
8. **Ask for Help**: Oracle Support and community are valuable resources

---

**Remember**: The goal is steady, measurable improvement. Start with quick wins, measure results, then tackle bigger optimizations.

**Time Investment**:
- Initial Setup: 2-4 hours
- Weekly Maintenance: 30 minutes
- Monthly Review: 2 hours

**Expected Results**:
- 30-50% improvement in Page Designer load times
- 20-40% reduction in database query times
- Better overall user experience
- Reduced server resource usage

Good luck! 🚀
