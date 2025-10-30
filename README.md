# Oracle APEX Page Designer Performance Optimization

This repository contains comprehensive optimization configurations and scripts for improving Oracle APEX Page Designer performance in environments running Oracle Database 23ai with ORDS deployed on Apache Tomcat.

## 📋 Contents

### Configuration Files
- **`ords-config-optimization.properties`** - ORDS performance configuration
- **`oracle-database-optimizations.sql`** - Database optimization SQL scripts

### Documentation
- **`PERFORMANCE_OPTIMIZATION_GUIDE.md`** - Comprehensive optimization guide (START HERE)
- **`QUICK_REFERENCE.md`** - Quick reference for common tasks
- **`tomcat-performance-config.md`** - Apache Tomcat configuration guide
- **`client-side-optimizations.md`** - Browser and APEX application optimizations

### Scripts
- **`performance-monitoring-scripts.sh`** - Database and application server monitoring
- **`bundle-size-analysis.sh`** - JavaScript/CSS bundle size analysis

## 🚀 Quick Start

1. **Read the Quick Reference:**
   ```bash
   cat QUICK_REFERENCE.md
   ```

2. **Review the Full Guide:**
   ```bash
   cat PERFORMANCE_OPTIMIZATION_GUIDE.md
   ```

3. **Apply ORDS Configuration:**
   - Review `ords-config-optimization.properties`
   - Merge settings into your ORDS configuration

4. **Apply Tomcat Configuration:**
   - Follow instructions in `tomcat-performance-config.md`
   - Update `setenv.sh` and `server.xml`

5. **Run Database Optimizations:**
   ```bash
   sqlplus / as sysdba @oracle-database-optimizations.sql
   ```

6. **Set Up Monitoring:**
   ```bash
   chmod +x performance-monitoring-scripts.sh bundle-size-analysis.sh
   ./performance-monitoring-scripts.sh interactive
   ```

## 📊 Performance Targets

- Page Load Time: < 2 seconds
- Property Update Time: < 500ms
- Database Query Time: < 100ms (95th percentile)
- Connection Pool Utilization: < 80%
- JVM Heap Usage: < 75%

## 🔍 Monitoring

### Quick Health Check
```bash
./performance-monitoring-scripts.sh all
```

### Find Slow Queries
```sql
-- Run the slow query identification script
sqlplus / as sysdba @/tmp/find_slow_apex_queries.sql
```

### Bundle Analysis
```bash
./bundle-size-analysis.sh report
```

## 📚 Documentation Structure

1. **PERFORMANCE_OPTIMIZATION_GUIDE.md** - Main guide covering all aspects
2. **QUICK_REFERENCE.md** - Quick wins and common fixes
3. **tomcat-performance-config.md** - Detailed Tomcat configuration
4. **client-side-optimizations.md** - Browser and APEX optimizations
5. **oracle-database-optimizations.sql** - Database optimization scripts

## ⚠️ Important Notes

- **Test in non-production first:** All configurations should be tested in a development environment before applying to production.
- **Backup configurations:** Always backup existing configuration files before making changes.
- **Monitor after changes:** Use the monitoring scripts to verify improvements and identify any issues.
- **Oracle 23ai features:** This guide leverages Oracle Database 23ai specific features like automatic indexing.

## 🛠️ Troubleshooting

Common issues and solutions are documented in the main guide. For specific problems:

1. Run monitoring scripts to identify bottlenecks
2. Review relevant configuration sections
3. Check database and application server logs
4. Consult Oracle documentation for your specific version

## 📝 Version Compatibility

- **Oracle Database:** 23ai
- **Oracle APEX:** 23.2+
- **ORDS:** Latest version
- **Apache Tomcat:** 9.x / 10.x

## 🔗 Additional Resources

- [Oracle APEX Documentation](https://docs.oracle.com/en/database/oracle/application-express/)
- [ORDS Configuration Guide](https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/)
- [Oracle Database Performance Tuning](https://docs.oracle.com/en/database/oracle/oracle-database/23/tgdba/)

---

**Note:** This is a comprehensive optimization package. Start with the Quick Reference for immediate improvements, then review the full guide for complete optimization.
