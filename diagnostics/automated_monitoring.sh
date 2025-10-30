#!/bin/bash
################################################################################
# Automated Performance Monitoring Script
################################################################################
# Purpose: Continuous monitoring of APEX/ORDS/Tomcat performance
# Usage: ./automated_monitoring.sh [options]
# Options:
#   -i <seconds>  Interval between checks (default: 300)
#   -o <dir>      Output directory (default: ./monitoring_output)
#   -d <dsn>      Database TNS name/connection string
#   -u <user>     Database username
#   -t <tomcat>   Tomcat base directory
################################################################################

# Default values
INTERVAL=300
OUTPUT_DIR="./monitoring_output"
DB_USER=""
DB_DSN=""
TOMCAT_HOME="${CATALINA_HOME:-/opt/tomcat}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Parse command line arguments
while getopts "i:o:d:u:t:h" opt; do
    case $opt in
        i) INTERVAL=$OPTARG ;;
        o) OUTPUT_DIR=$OPTARG ;;
        d) DB_DSN=$OPTARG ;;
        u) DB_USER=$OPTARG ;;
        t) TOMCAT_HOME=$OPTARG ;;
        h) 
            echo "Usage: $0 [-i interval] [-o output_dir] [-d dsn] [-u user] [-t tomcat_home]"
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

# Create output directory
mkdir -p "${OUTPUT_DIR}"
LOG_FILE="${OUTPUT_DIR}/monitoring_${TIMESTAMP}.log"

################################################################################
# Logging Functions
################################################################################

log_info() {
    echo -e "${GREEN}[INFO]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "${LOG_FILE}"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "${LOG_FILE}"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "${LOG_FILE}"
}

################################################################################
# System Monitoring Functions
################################################################################

check_system_resources() {
    local output_file="${OUTPUT_DIR}/system_resources_${TIMESTAMP}.txt"
    
    echo "=== System Resources ===" >> "${output_file}"
    echo "Timestamp: $(date)" >> "${output_file}"
    echo "" >> "${output_file}"
    
    # CPU Usage
    echo "CPU Usage:" >> "${output_file}"
    mpstat 1 1 >> "${output_file}" 2>&1 || top -bn1 | grep "Cpu(s)" >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Memory Usage
    echo "Memory Usage:" >> "${output_file}"
    free -h >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Disk Usage
    echo "Disk Usage:" >> "${output_file}"
    df -h >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Disk I/O
    echo "Disk I/O:" >> "${output_file}"
    iostat -x 1 2 >> "${output_file}" 2>&1 || echo "iostat not available" >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Network Statistics
    echo "Network Statistics:" >> "${output_file}"
    netstat -s >> "${output_file}" 2>&1 || ss -s >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Check for resource warnings
    local mem_used=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
    if [ ${mem_used} -gt 90 ]; then
        log_warn "High memory usage: ${mem_used}%"
    fi
    
    local disk_used=$(df / | tail -1 | awk '{print int($5)}')
    if [ ${disk_used} -gt 90 ]; then
        log_warn "High disk usage: ${disk_used}%"
    fi
}

################################################################################
# Tomcat Monitoring Functions
################################################################################

check_tomcat() {
    local output_file="${OUTPUT_DIR}/tomcat_${TIMESTAMP}.txt"
    
    echo "=== Tomcat Monitoring ===" >> "${output_file}"
    echo "Timestamp: $(date)" >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Check if Tomcat is running
    if pgrep -f "catalina" > /dev/null; then
        log_info "Tomcat is running"
        
        # Get Tomcat PID
        TOMCAT_PID=$(pgrep -f "catalina" | head -1)
        echo "Tomcat PID: ${TOMCAT_PID}" >> "${output_file}"
        
        # JVM Memory Usage
        echo "" >> "${output_file}"
        echo "JVM Memory Usage:" >> "${output_file}"
        jstat -gc ${TOMCAT_PID} >> "${output_file}" 2>&1
        echo "" >> "${output_file}"
        
        # Thread Count
        echo "Thread Count:" >> "${output_file}"
        jstack ${TOMCAT_PID} 2>/dev/null | grep "java.lang.Thread.State" | wc -l >> "${output_file}"
        echo "" >> "${output_file}"
        
        # Thread States
        echo "Thread States:" >> "${output_file}"
        jstack ${TOMCAT_PID} 2>/dev/null | grep "java.lang.Thread.State" | sort | uniq -c >> "${output_file}"
        echo "" >> "${output_file}"
        
        # Check Tomcat Manager (if available)
        if command -v curl &> /dev/null; then
            echo "Tomcat Manager Status:" >> "${output_file}"
            curl -s http://localhost:8080/manager/status?XML=true 2>/dev/null >> "${output_file}" || \
                echo "Tomcat Manager not accessible" >> "${output_file}"
        fi
        
        # Check catalina.out for errors
        if [ -f "${TOMCAT_HOME}/logs/catalina.out" ]; then
            echo "" >> "${output_file}"
            echo "Recent Errors in catalina.out:" >> "${output_file}"
            tail -100 "${TOMCAT_HOME}/logs/catalina.out" | grep -i "error\|exception\|OutOfMemory" >> "${output_file}"
        fi
        
        # Check heap usage warning
        local heap_used=$(jstat -gc ${TOMCAT_PID} 2>/dev/null | tail -1 | awk '{print int(($3+$4+$6+$8)/($3+$4+$6+$8+$5+$7) * 100)}')
        if [ ! -z "${heap_used}" ] && [ ${heap_used} -gt 90 ]; then
            log_warn "High JVM heap usage: ${heap_used}%"
        fi
        
    else
        log_error "Tomcat is not running!"
    fi
}

################################################################################
# ORDS Monitoring Functions
################################################################################

check_ords() {
    local output_file="${OUTPUT_DIR}/ords_${TIMESTAMP}.txt"
    
    echo "=== ORDS Monitoring ===" >> "${output_file}"
    echo "Timestamp: $(date)" >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Check ORDS process
    if pgrep -f "ords.war" > /dev/null; then
        log_info "ORDS is running"
        
        # Check ORDS logs for errors
        ORDS_LOG_DIR="${ORDS_HOME:-/opt/ords}/logs"
        if [ -d "${ORDS_LOG_DIR}" ]; then
            echo "Recent ORDS Errors:" >> "${output_file}"
            find "${ORDS_LOG_DIR}" -name "*.log" -mtime -1 -exec grep -i "error\|exception\|warning" {} \; | tail -50 >> "${output_file}"
        fi
        
        # Check ORDS connectivity
        if command -v curl &> /dev/null; then
            echo "" >> "${output_file}"
            echo "ORDS Health Check:" >> "${output_file}"
            RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ords/ 2>/dev/null)
            if [ "${RESPONSE}" == "200" ] || [ "${RESPONSE}" == "302" ]; then
                log_info "ORDS is accessible (HTTP ${RESPONSE})"
                echo "ORDS Response: ${RESPONSE}" >> "${output_file}"
            else
                log_warn "ORDS returned unexpected response: ${RESPONSE}"
                echo "ORDS Response: ${RESPONSE}" >> "${output_file}"
            fi
        fi
        
    else
        log_warn "ORDS process not found"
    fi
}

################################################################################
# Database Monitoring Functions
################################################################################

check_database() {
    local output_file="${OUTPUT_DIR}/database_${TIMESTAMP}.txt"
    
    echo "=== Database Monitoring ===" >> "${output_file}"
    echo "Timestamp: $(date)" >> "${output_file}"
    echo "" >> "${output_file}"
    
    if [ -z "${DB_USER}" ] || [ -z "${DB_DSN}" ]; then
        log_warn "Database credentials not provided, skipping DB checks"
        return
    fi
    
    # Prompt for password if not in environment
    if [ -z "${DB_PASSWORD}" ]; then
        echo "Enter password for ${DB_USER}:"
        read -s DB_PASSWORD
    fi
    
    # Create temporary SQL script
    local sql_script=$(mktemp)
    cat > "${sql_script}" << 'EOF'
SET PAGESIZE 1000
SET LINESIZE 200
SET FEEDBACK OFF

-- Active Sessions
SELECT 'Active Sessions: ' || COUNT(*) FROM v$session WHERE status = 'ACTIVE' AND username IS NOT NULL;

-- Blocking Sessions
SELECT 'Blocking Sessions: ' || COUNT(*) FROM v$session WHERE blocking_session IS NOT NULL;

-- ORDS Connection Pool
SELECT 'ORDS Connections: ' || COUNT(*) 
FROM v$session 
WHERE program LIKE '%ORDS%' OR program LIKE '%JDBC%';

-- Database CPU
SELECT 'DB CPU (%):', ROUND(value, 2) 
FROM v$sysmetric 
WHERE metric_name = 'Database CPU Time Ratio' AND group_id = 2;

-- Wait Events
SELECT event, total_waits, ROUND(time_waited/100, 2) time_sec
FROM v$system_event 
WHERE wait_class != 'Idle' 
ORDER BY time_waited DESC 
FETCH FIRST 5 ROWS ONLY;

-- Tablespace Usage
SELECT tablespace_name, ROUND(used_percent, 2) pct_used
FROM dba_tablespace_usage_metrics
WHERE used_percent > 80;

EXIT;
EOF
    
    # Execute SQL script
    sqlplus -S "${DB_USER}/${DB_PASSWORD}@${DB_DSN}" @"${sql_script}" >> "${output_file}" 2>&1
    
    if [ $? -eq 0 ]; then
        log_info "Database check completed"
        
        # Check for specific warnings
        if grep -q "Blocking Sessions: [1-9]" "${output_file}"; then
            log_warn "Blocking sessions detected in database"
        fi
        
    else
        log_error "Database check failed"
    fi
    
    # Clean up
    rm -f "${sql_script}"
}

################################################################################
# Network Monitoring Functions
################################################################################

check_network() {
    local output_file="${OUTPUT_DIR}/network_${TIMESTAMP}.txt"
    
    echo "=== Network Monitoring ===" >> "${output_file}"
    echo "Timestamp: $(date)" >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Active Connections
    echo "Active Connections to Port 8080:" >> "${output_file}"
    netstat -an | grep ":8080" | wc -l >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Connection States
    echo "Connection States:" >> "${output_file}"
    netstat -an | grep ":8080" | awk '{print $6}' | sort | uniq -c >> "${output_file}"
    echo "" >> "${output_file}"
    
    # Check for TIME_WAIT accumulation
    local time_wait_count=$(netstat -an | grep ":8080" | grep "TIME_WAIT" | wc -l)
    if [ ${time_wait_count} -gt 1000 ]; then
        log_warn "High TIME_WAIT connection count: ${time_wait_count}"
    fi
}

################################################################################
# Performance Summary
################################################################################

generate_summary() {
    local summary_file="${OUTPUT_DIR}/summary_${TIMESTAMP}.txt"
    
    echo "=== Performance Monitoring Summary ===" > "${summary_file}"
    echo "Generated: $(date)" >> "${summary_file}"
    echo "" >> "${summary_file}"
    
    # System Health
    echo "System Health:" >> "${summary_file}"
    echo "  CPU Load: $(uptime | awk -F'load average:' '{print $2}')" >> "${summary_file}"
    echo "  Memory Used: $(free | grep Mem | awk '{print int($3/$2 * 100)}')%" >> "${summary_file}"
    echo "  Disk Used: $(df / | tail -1 | awk '{print $5}')" >> "${summary_file}"
    echo "" >> "${summary_file}"
    
    # Application Status
    echo "Application Status:" >> "${summary_file}"
    pgrep -f "catalina" > /dev/null && echo "  Tomcat: Running" >> "${summary_file}" || echo "  Tomcat: NOT Running" >> "${summary_file}"
    pgrep -f "ords.war" > /dev/null && echo "  ORDS: Running" >> "${summary_file}" || echo "  ORDS: NOT Running" >> "${summary_file}"
    echo "" >> "${summary_file}"
    
    # Network
    echo "Network:" >> "${summary_file}"
    echo "  Active Connections (8080): $(netstat -an 2>/dev/null | grep ":8080" | wc -l)" >> "${summary_file}"
    echo "" >> "${summary_file}"
    
    log_info "Summary generated: ${summary_file}"
}

################################################################################
# Main Monitoring Loop
################################################################################

main() {
    log_info "Starting automated monitoring (Interval: ${INTERVAL}s)"
    log_info "Output directory: ${OUTPUT_DIR}"
    
    # Initial checks
    log_info "Running initial system checks..."
    
    while true; do
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        
        log_info "=== Starting monitoring cycle ==="
        
        # Run all checks
        check_system_resources
        check_tomcat
        check_ords
        check_network
        [ ! -z "${DB_USER}" ] && [ ! -z "${DB_DSN}" ] && check_database
        
        # Generate summary
        generate_summary
        
        log_info "=== Monitoring cycle complete ==="
        log_info "Next check in ${INTERVAL} seconds"
        
        # Cleanup old files (keep last 7 days)
        find "${OUTPUT_DIR}" -type f -mtime +7 -delete 2>/dev/null
        
        # Sleep until next interval
        sleep ${INTERVAL}
    done
}

################################################################################
# Signal Handlers
################################################################################

cleanup() {
    log_info "Monitoring stopped"
    exit 0
}

trap cleanup SIGINT SIGTERM

################################################################################
# Start Monitoring
################################################################################

# Check prerequisites
if ! command -v sqlplus &> /dev/null && [ ! -z "${DB_USER}" ]; then
    log_warn "SQL*Plus not found, database checks will be skipped"
fi

if ! command -v jstat &> /dev/null; then
    log_warn "jstat not found, JVM monitoring will be limited"
fi

# Start main loop
main
