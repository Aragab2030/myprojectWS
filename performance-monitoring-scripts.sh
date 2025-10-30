#!/bin/bash
# Performance Monitoring Scripts for Oracle APEX Page Designer
# These scripts help identify performance bottlenecks

# ============================================================================
# Script 1: Database Session Monitoring
# ============================================================================

cat > /tmp/monitor_apex_sessions.sql << 'EOF'
-- Monitor active APEX sessions and their resource usage
SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    s.module,
    s.action,
    s.status,
    s.logon_time,
    s.last_call_et as seconds_since_last_call,
    ROUND(p.value/1024/1024, 2) as pga_mb,
    s.sql_id,
    s.event,
    s.wait_time,
    s.seconds_in_wait
FROM v$session s
LEFT JOIN v$sesstat st ON s.sid = st.sid
LEFT JOIN v$statname sn ON st.statistic# = sn.statistic#
LEFT JOIN (SELECT sid, value FROM v$sesstat 
           WHERE statistic# = (SELECT statistic# FROM v$statname WHERE name = 'session pga memory')) p
    ON s.sid = p.sid
WHERE s.program LIKE '%ORDS%'
   OR s.module LIKE '%APEX%'
   OR s.program LIKE '%apex%'
ORDER BY s.last_call_et DESC;
EOF

# ============================================================================
# Script 2: Slow Query Identification
# ============================================================================

cat > /tmp/find_slow_apex_queries.sql << 'EOF'
-- Find slow queries related to APEX Page Designer
SELECT 
    sql_id,
    SUBSTR(sql_text, 1, 100) as sql_preview,
    executions,
    ROUND(elapsed_time/1000000, 2) as total_elapsed_seconds,
    ROUND(elapsed_time/1000000/NULLIF(executions, 0), 2) as avg_elapsed_seconds,
    ROUND(cpu_time/1000000, 2) as total_cpu_seconds,
    buffer_gets,
    disk_reads,
    direct_writes,
    rows_processed,
    fetches,
    first_load_time,
    last_load_time
FROM v$sql
WHERE (UPPER(sql_text) LIKE '%WWV_FLOW%'
    OR UPPER(sql_text) LIKE '%APEX%'
    OR UPPER(sql_text) LIKE '%PAGE_DESIGNER%')
  AND executions > 0
  AND elapsed_time/1000000/NULLIF(executions, 0) > 1  -- Average > 1 second
ORDER BY elapsed_time DESC
FETCH FIRST 50 ROWS ONLY;
EOF

# ============================================================================
# Script 3: ORDS Connection Pool Status
# ============================================================================

cat > /tmp/check_ords_pool.sql << 'EOF'
-- Check ORDS connection pool status
SELECT 
    pool_name,
    status,
    minsize as min_size,
    maxsize as max_size,
    activesize as active_size,
    currentsize as current_size,
    waitcount as wait_count,
    timeoutcount as timeout_count
FROM v$pool;
EOF

# ============================================================================
# Script 4: Top Wait Events for APEX
# ============================================================================

cat > /tmp/apex_wait_events.sql << 'EOF'
-- Identify top wait events for APEX sessions
SELECT 
    e.event,
    COUNT(*) as wait_count,
    SUM(e.time_waited) as total_time_waited_ms,
    AVG(e.time_waited) as avg_time_waited_ms,
    SUM(e.time_waited_micro) as total_time_waited_micro
FROM v$session_event e
JOIN v$session s ON e.sid = s.sid
WHERE (s.program LIKE '%ORDS%'
    OR s.module LIKE '%APEX%'
    OR s.program LIKE '%apex%')
  AND e.wait_class != 'Idle'
  AND e.time_waited > 0
GROUP BY e.event
ORDER BY total_time_waited_ms DESC
FETCH FIRST 20 ROWS ONLY;
EOF

# ============================================================================
# Script 5: Memory Usage by Session
# ============================================================================

cat > /tmp/session_memory_usage.sql << 'EOF'
-- Memory usage by APEX sessions
SELECT 
    s.sid,
    s.username,
    s.program,
    ROUND(pga.value/1024/1024, 2) as pga_mb,
    ROUND(uga.value/1024/1024, 2) as uga_mb,
    ROUND((pga.value + uga.value)/1024/1024, 2) as total_mb
FROM v$session s
LEFT JOIN (
    SELECT sid, SUM(value) as value
    FROM v$sesstat
    WHERE statistic# IN (
        SELECT statistic# FROM v$statname 
        WHERE name LIKE '%pga%memory%'
    )
    GROUP BY sid
) pga ON s.sid = pga.sid
LEFT JOIN (
    SELECT sid, SUM(value) as value
    FROM v$sesstat
    WHERE statistic# IN (
        SELECT statistic# FROM v$statname 
        WHERE name LIKE '%uga%memory%'
    )
    GROUP BY sid
) uga ON s.sid = uga.sid
WHERE (s.program LIKE '%ORDS%'
    OR s.module LIKE '%APEX%'
    OR s.program LIKE '%apex%')
  AND (pga.value > 0 OR uga.value > 0)
ORDER BY total_mb DESC NULLS LAST;
EOF

# ============================================================================
# Script 6: Real-Time SQL Monitoring
# ============================================================================

cat > /tmp/realtime_sql_monitor.sql << 'EOF'
-- Real-time SQL monitoring for long-running queries
SELECT 
    sql_id,
    sql_text,
    status,
    ROUND(elapsed_time/1000000, 2) as elapsed_seconds,
    ROUND(cpu_time/1000000, 2) as cpu_seconds,
    buffer_gets,
    disk_reads,
    direct_writes,
    rows_processed,
    fetches,
    executions,
    first_refresh_time,
    last_refresh_time
FROM v$sql_monitor
WHERE status != 'DONE'
ORDER BY elapsed_time DESC;
EOF

# ============================================================================
# Shell Script Functions
# ============================================================================

function run_apex_session_monitor() {
    echo "=== APEX Session Monitor ==="
    sqlplus -S / as sysdba @/tmp/monitor_apex_sessions.sql
}

function run_slow_query_check() {
    echo "=== Slow Query Identification ==="
    sqlplus -S / as sysdba @/tmp/find_slow_apex_queries.sql
}

function check_ords_pool() {
    echo "=== ORDS Connection Pool Status ==="
    sqlplus -S / as sysdba @/tmp/check_ords_pool.sql
}

function check_wait_events() {
    echo "=== APEX Wait Events ==="
    sqlplus -S / as sysdba @/tmp/apex_wait_events.sql
}

function check_memory_usage() {
    echo "=== Session Memory Usage ==="
    sqlplus -S / as sysdba @/tmp/session_memory_usage.sql
}

function monitor_realtime_sql() {
    echo "=== Real-Time SQL Monitoring ==="
    sqlplus -S / as sysdba @/tmp/realtime_sql_monitor.sql
}

# ============================================================================
# Tomcat Performance Monitoring
# ============================================================================

function check_tomcat_memory() {
    echo "=== Tomcat Memory Usage ==="
    if command -v jstat &> /dev/null; then
        TOMCAT_PID=$(pgrep -f catalina | head -1)
        if [ -n "$TOMCAT_PID" ]; then
            jstat -gc $TOMCAT_PID
            echo ""
            echo "=== Memory Details ==="
            jstat -gccapacity $TOMCAT_PID
        else
            echo "Tomcat process not found"
        fi
    else
        echo "jstat not found. Install JDK to use this feature."
    fi
}

function check_tomcat_threads() {
    echo "=== Tomcat Thread Count ==="
    TOMCAT_PID=$(pgrep -f catalina | head -1)
    if [ -n "$TOMCAT_PID" ]; then
        echo "Thread count: $(ps -T -p $TOMCAT_PID | wc -l)"
    else
        echo "Tomcat process not found"
    fi
}

function check_tomcat_connections() {
    echo "=== Active Network Connections ==="
    if [ -n "$TOMCAT_PID" ]; then
        netstat -an | grep ESTABLISHED | grep -E ':(8080|8443)' | wc -l
        echo "connections on ports 8080/8443"
    fi
}

# ============================================================================
# ORDS Performance Monitoring
# ============================================================================

function check_ords_logs() {
    echo "=== Recent ORDS Errors ==="
    ORDS_LOG_DIR="${ORDS_CONFIG_DIR:-/opt/oracle/ords/config/logs}"
    if [ -d "$ORDS_LOG_DIR" ]; then
        find "$ORDS_LOG_DIR" -name "*.log" -type f -mtime -1 -exec tail -50 {} \; | grep -i error | tail -20
    else
        echo "ORDS log directory not found. Set ORDS_CONFIG_DIR environment variable."
    fi
}

function check_ords_responses() {
    echo "=== ORDS Response Time Analysis ==="
    ORDS_LOG_DIR="${ORDS_CONFIG_DIR:-/opt/oracle/ords/config/logs}"
    if [ -d "$ORDS_LOG_DIR" ]; then
        echo "Analyzing access logs for slow requests (>1000ms)..."
        find "$ORDS_LOG_DIR" -name "*access*.log" -type f -mtime -1 -exec awk '
            /GET.*apex.*designer/ {
                if ($NF > 1000) {
                    print $NF "ms - " $0
                }
            }
        ' {} \;
    else
        echo "ORDS log directory not found."
    fi
}

# ============================================================================
# System Resource Monitoring
# ============================================================================

function check_system_resources() {
    echo "=== System Resource Usage ==="
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print $2}'
    echo ""
    echo "Memory Usage:"
    free -h
    echo ""
    echo "Disk I/O:"
    iostat -x 1 2 | tail -5
}

# ============================================================================
# Main Menu
# ============================================================================

function show_menu() {
    echo ""
    echo "Oracle APEX Page Designer Performance Monitoring"
    echo "================================================"
    echo "1. Monitor APEX Sessions"
    echo "2. Find Slow Queries"
    echo "3. Check ORDS Connection Pool"
    echo "4. Check Wait Events"
    echo "5. Check Memory Usage"
    echo "6. Real-Time SQL Monitoring"
    echo "7. Check Tomcat Memory"
    echo "8. Check Tomcat Threads"
    echo "9. Check ORDS Logs"
    echo "10. Check System Resources"
    echo "11. Run All Checks"
    echo "0. Exit"
    echo ""
}

function run_all_checks() {
    check_system_resources
    echo ""
    check_tomcat_memory
    echo ""
    check_tomcat_threads
    echo ""
    check_ords_pool
    echo ""
    check_wait_events
    echo ""
    check_memory_usage
    echo ""
    run_slow_query_check
}

# ============================================================================
# Interactive Mode
# ============================================================================

if [ "$1" == "interactive" ] || [ "$1" == "" ]; then
    while true; do
        show_menu
        read -p "Select option: " choice
        case $choice in
            1) run_apex_session_monitor ;;
            2) run_slow_query_check ;;
            3) check_ords_pool ;;
            4) check_wait_events ;;
            5) check_memory_usage ;;
            6) monitor_realtime_sql ;;
            7) check_tomcat_memory ;;
            8) check_tomcat_threads ;;
            9) check_ords_logs ;;
            10) check_system_resources ;;
            11) run_all_checks ;;
            0) exit 0 ;;
            *) echo "Invalid option" ;;
        esac
    done
else
    # Non-interactive mode - run specific check
    case $1 in
        sessions) run_apex_session_monitor ;;
        queries) run_slow_query_check ;;
        pool) check_ords_pool ;;
        waits) check_wait_events ;;
        memory) check_memory_usage ;;
        sql) monitor_realtime_sql ;;
        tomcat-mem) check_tomcat_memory ;;
        tomcat-threads) check_tomcat_threads ;;
        ords-logs) check_ords_logs ;;
        system) check_system_resources ;;
        all) run_all_checks ;;
        *) echo "Usage: $0 [interactive|sessions|queries|pool|waits|memory|sql|tomcat-mem|tomcat-threads|ords-logs|system|all]" ;;
    esac
fi
