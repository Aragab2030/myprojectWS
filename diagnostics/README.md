# Diagnostic Scripts

This directory contains SQL and shell scripts for diagnosing performance issues in Oracle APEX, ORDS, and Tomcat environments.

## Scripts Overview

### SQL Scripts

#### 1. `db_performance_check.sql`
**Purpose**: Comprehensive database performance analysis

**What it checks**:
- Database version and configuration
- Performance metrics (CPU, waits, cache hit ratios)
- Top SQL queries by elapsed time and CPU
- Active sessions and wait events
- APEX schema statistics freshness
- Missing index opportunities
- Table and index segment sizes
- Locking and blocking sessions
- Tablespace usage
- Invalid objects

**How to run**:
```bash
sqlplus username/password@database @db_performance_check.sql > output.txt
```

**Expected runtime**: 2-5 minutes

**Output**: Text file with comprehensive performance metrics

---

#### 2. `apex_metadata_check.sql`
**Purpose**: Analyze APEX metadata for performance issues

**What it checks**:
- Large applications with many components
- Complex pages (many items/regions)
- Dynamic Actions with large JavaScript
- Regions with complex SQL queries
- Large List of Values definitions
- Static file sizes
- Deprecated features in use
- Session state protection issues

**How to run**:
```bash
sqlplus username/password@database @apex_metadata_check.sql > apex_analysis.txt
```

**Expected runtime**: 1-3 minutes

**Output**: Detailed analysis of APEX application structure

---

#### 3. `session_diagnostics.sql`
**Purpose**: Diagnose active database session issues

**What it checks**:
- Current active sessions
- High PGA/memory consumers
- Temp space usage
- Long-running queries
- Blocking session tree
- APEX-specific sessions
- Top wait events by session
- Open cursor usage
- I/O and parse statistics
- Lock and enqueue waits
- ORDS connection pool analysis

**How to run**:
```bash
sqlplus username/password@database @session_diagnostics.sql > sessions.txt
```

**Expected runtime**: 30 seconds - 2 minutes

**Output**: Real-time session analysis

---

### Shell Scripts

#### 4. `automated_monitoring.sh`
**Purpose**: Continuous monitoring of the entire stack

**What it monitors**:
- System resources (CPU, memory, disk, I/O)
- Tomcat (JVM memory, threads, errors)
- ORDS (process status, logs, connectivity)
- Database (sessions, waits, blocking)
- Network (connections, states)

**How to run**:
```bash
# Basic monitoring (300-second intervals)
./automated_monitoring.sh -i 300 -o ./monitoring_output

# Full monitoring with database checks
./automated_monitoring.sh \
  -i 300 \
  -o ./monitoring_output \
  -d your_database_tns \
  -u your_db_user \
  -t /opt/tomcat
```

**Parameters**:
- `-i`: Interval in seconds between checks (default: 300)
- `-o`: Output directory (default: ./monitoring_output)
- `-d`: Database TNS name or connection string
- `-u`: Database username
- `-t`: Tomcat home directory

**Expected runtime**: Runs continuously until stopped (Ctrl+C)

**Output**: Creates timestamped files in output directory:
- `monitoring_*.log` - Main log file
- `system_resources_*.txt` - System metrics
- `tomcat_*.txt` - Tomcat/JVM metrics
- `ords_*.txt` - ORDS status
- `database_*.txt` - Database metrics
- `network_*.txt` - Network statistics
- `summary_*.txt` - Overall summary

---

## Usage Scenarios

### Scenario 1: Initial Performance Assessment
```bash
# Run all diagnostic scripts
sqlplus user/pass@db @db_performance_check.sql > reports/db_baseline.txt
sqlplus user/pass@db @apex_metadata_check.sql > reports/apex_baseline.txt
sqlplus user/pass@db @session_diagnostics.sql > reports/session_baseline.txt

# Review output files
grep -i "warn\|error\|slow" reports/*.txt
```

### Scenario 2: Troubleshooting Slowness
```bash
# Check current sessions
sqlplus user/pass@db @session_diagnostics.sql

# Look for:
# - Blocking sessions
# - High wait times
# - Long-running queries
# - High memory usage
```

### Scenario 3: Pre/Post Optimization Comparison
```bash
# Before optimization
sqlplus user/pass@db @db_performance_check.sql > reports/before_optimization.txt

# Apply optimizations...

# After optimization (wait 30+ minutes for realistic results)
sqlplus user/pass@db @db_performance_check.sql > reports/after_optimization.txt

# Compare
diff reports/before_optimization.txt reports/after_optimization.txt
```

### Scenario 4: Continuous Monitoring
```bash
# Start monitoring in background
nohup ./automated_monitoring.sh -i 300 -o /var/log/apex_monitoring &

# Check status
tail -f /var/log/apex_monitoring/monitoring_*.log

# Generate daily report
cat /var/log/apex_monitoring/summary_*.txt | \
  grep "$(date +%Y%m%d)" > daily_report.txt
```

## Interpreting Results

### Red Flags to Look For

#### In `db_performance_check.sql`:
- ❌ Statistics older than 7 days
- ❌ Buffer Cache Hit Ratio < 95%
- ❌ Library Cache Hit Ratio < 98%
- ❌ Top SQL with elapsed time > 1 second
- ❌ Blocking sessions present
- ❌ Tablespace > 90% full
- ❌ Invalid objects in APEX schemas

#### In `apex_metadata_check.sql`:
- ❌ Pages with > 50 total components
- ❌ JavaScript code > 5000 characters
- ❌ SQL queries > 2000 characters
- ❌ Static files > 500 KB
- ❌ Use of deprecated features
- ❌ Unprotected hidden items

#### In `session_diagnostics.sql`:
- ❌ Blocking sessions
- ❌ Sessions with wait time > 60 seconds
- ❌ PGA usage > 500 MB per session
- ❌ Temp space usage > 1 GB per session
- ❌ Cursor usage > 80% of max

#### In `automated_monitoring.sh`:
- ❌ Memory usage > 90%
- ❌ Disk usage > 90%
- ❌ JVM heap usage > 90%
- ❌ Thread count > 200
- ❌ TIME_WAIT connections > 1000
- ❌ Service not running

### Good Performance Indicators

- ✅ Statistics gathered within last 7 days
- ✅ Buffer cache hit ratio > 95%
- ✅ Average query response < 100ms
- ✅ No blocking sessions
- ✅ Tablespace usage < 80%
- ✅ All objects valid
- ✅ Pages with < 50 components
- ✅ JVM heap usage < 80%
- ✅ Response times < 200ms

## Scheduling Regular Checks

### Cron Job Examples

#### Daily Performance Check (2 AM)
```bash
0 2 * * * /usr/bin/sqlplus -S user/pass@db @/path/to/db_performance_check.sql > /path/to/reports/daily_$(date +\%Y\%m\%d).txt
```

#### Weekly APEX Analysis (Sunday 3 AM)
```bash
0 3 * * 0 /usr/bin/sqlplus -S user/pass@db @/path/to/apex_metadata_check.sql > /path/to/reports/weekly_$(date +\%Y\%m\%d).txt
```

#### Hourly Session Check
```bash
0 * * * * /usr/bin/sqlplus -S user/pass@db @/path/to/session_diagnostics.sql > /tmp/session_check.txt && grep -i "blocking\|error" /tmp/session_check.txt && mail -s "Session Issues" admin@example.com < /tmp/session_check.txt
```

## Prerequisites

### For SQL Scripts
- Oracle Database 19c or higher (Oracle 23 AI recommended)
- SQL*Plus installed
- User account with:
  - SELECT on DBA_* views
  - SELECT on V$ views
  - APEX schema access (for metadata queries)

### For Shell Scripts
- Linux/Unix environment
- Bash shell
- Tools: `jstat`, `jstack`, `netstat`/`ss`, `curl` (optional)
- For database checks: SQL*Plus
- Permissions to read Tomcat logs and ORDS logs

## Troubleshooting

### SQL Scripts Failing

**Issue**: "Table or view does not exist"
**Solution**: Grant SELECT on DBA_TABLES and V$ views
```sql
GRANT SELECT ANY DICTIONARY TO your_user;
-- OR specific grants:
GRANT SELECT ON DBA_TABLES TO your_user;
GRANT SELECT ON V_$SESSION TO your_user;
```

**Issue**: "Insufficient privileges"
**Solution**: Connect as user with appropriate privileges or as SYSDBA

### Monitoring Script Issues

**Issue**: "jstat command not found"
**Solution**: Ensure Java JDK (not just JRE) is installed

**Issue**: "Cannot access Tomcat logs"
**Solution**: Run as user with permissions or adjust TOMCAT_HOME path

**Issue**: Database password prompt loop
**Solution**: Set DB_PASSWORD environment variable:
```bash
export DB_PASSWORD="your_password"
./automated_monitoring.sh ...
```

## Best Practices

1. **Run Regularly**: Schedule scripts to run automatically
2. **Archive Results**: Keep historical data for trend analysis
3. **Compare Results**: Look for degradation over time
4. **Act on Findings**: Don't just collect data, use it!
5. **Document Changes**: Note when optimizations are applied
6. **Test First**: Run in non-production before production
7. **Secure Credentials**: Use wallet or secure credential storage
8. **Monitor Storage**: Clean up old monitoring files regularly

## Output Files Management

### Automatic Cleanup
The monitoring script automatically cleans up files older than 7 days.

### Manual Cleanup
```bash
# Delete files older than 30 days
find /path/to/reports -type f -name "*.txt" -mtime +30 -delete

# Compress old files
find /path/to/reports -type f -name "*.txt" -mtime +7 -exec gzip {} \;

# Archive to backup location
tar -czf backup_$(date +%Y%m).tar.gz reports/
mv backup_*.tar.gz /backup/location/
```

## Support

For issues or questions:
1. Check the main `PERFORMANCE_ANALYSIS.md` document
2. Review Oracle APEX documentation
3. Consult Oracle Support (My Oracle Support)
4. Post on Oracle APEX Community forums

---

**Last Updated**: 2025-10-30
**Version**: 1.0
**Compatibility**: Oracle 23 AI, APEX 23.2+, ORDS Latest
