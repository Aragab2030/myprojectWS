#!/bin/bash
################################################################################
# JVM Tuning Script for Apache Tomcat running ORDS/APEX
################################################################################
# File: setenv.sh
# Location: $CATALINA_HOME/bin/
# 
# This script sets JVM options for optimal ORDS/APEX performance
# Adjust memory values based on your available system RAM
################################################################################

# ========== Memory Configuration ==========

# Heap Size Recommendations:
# - Small deployment (< 50 users): 2-4 GB
# - Medium deployment (50-200 users): 4-8 GB
# - Large deployment (200+ users): 8-16 GB

# Minimum heap size (should equal maximum for consistent performance)
MIN_HEAP="4096m"

# Maximum heap size
MAX_HEAP="8192m"

# Metaspace (for class metadata) - usually 256m-512m is sufficient
METASPACE_SIZE="512m"
MAX_METASPACE="512m"

# Direct memory (for NIO operations) - important for ORDS
MAX_DIRECT_MEMORY="1024m"


# ========== Garbage Collection Configuration ==========

# G1GC (Recommended for Java 8+)
# Balances throughput and latency - ideal for ORDS/APEX
GC_ALGORITHM="-XX:+UseG1GC"

# G1GC Tuning Parameters
GC_PARAMS="-XX:MaxGCPauseMillis=200"           # Target max pause time
GC_PARAMS="$GC_PARAMS -XX:InitiatingHeapOccupancyPercent=45"  # When to start concurrent GC
GC_PARAMS="$GC_PARAMS -XX:G1ReservePercent=10"  # Reserve heap %
GC_PARAMS="$GC_PARAMS -XX:G1HeapRegionSize=16m" # Region size (adjust based on heap)

# Alternative: ZGC (Java 11+) - Ultra-low latency
# Uncomment if using Java 11+ and need < 10ms pause times
# GC_ALGORITHM="-XX:+UseZGC"
# GC_PARAMS="-XX:ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=5"

# Alternative: Shenandoah GC (Java 12+) - Very low latency
# Uncomment if using Java 12+ and need consistent low latency
# GC_ALGORITHM="-XX:+UseShenandoahGC"
# GC_PARAMS="-XX:ShenandoahGCHeuristics=adaptive"


# ========== Performance Tuning ==========

PERFORMANCE_OPTS=""

# String deduplication (reduces memory for duplicate strings)
PERFORMANCE_OPTS="$PERFORMANCE_OPTS -XX:+UseStringDeduplication"

# Aggressive optimization
PERFORMANCE_OPTS="$PERFORMANCE_OPTS -XX:+AggressiveOpts"

# Compressed ordinary object pointers (saves memory on 64-bit)
PERFORMANCE_OPTS="$PERFORMANCE_OPTS -XX:+UseCompressedOops"

# Biased locking (improves synchronization performance)
PERFORMANCE_OPTS="$PERFORMANCE_OPTS -XX:+UseBiasedLocking"

# Optimize string concatenation
PERFORMANCE_OPTS="$PERFORMANCE_OPTS -XX:+OptimizeStringConcat"

# Thread-local allocation buffers (reduces allocation contention)
PERFORMANCE_OPTS="$PERFORMANCE_OPTS -XX:+UseTLAB"


# ========== JIT Compiler Tuning ==========

JIT_OPTS=""

# Tiered compilation (faster startup, good peak performance)
JIT_OPTS="$JIT_OPTS -XX:+TieredCompilation"

# Code cache size (for compiled code)
JIT_OPTS="$JIT_OPTS -XX:ReservedCodeCacheSize=256m"

# Inline depth (how deep to inline methods)
JIT_OPTS="$JIT_OPTS -XX:MaxInlineLevel=15"


# ========== Network and NIO Tuning ==========

NETWORK_OPTS=""

# Prefer IPv4 (unless you need IPv6)
NETWORK_OPTS="$NETWORK_OPTS -Djava.net.preferIPv4Stack=true"

# Network buffer sizes
NETWORK_OPTS="$NETWORK_OPTS -Djava.net.preferIPv4Stack=true"

# File encoding
NETWORK_OPTS="$NETWORK_OPTS -Dfile.encoding=UTF-8"


# ========== Logging and Monitoring ==========

LOGGING_OPTS=""

# GC Logging (Important for tuning - keep enabled initially)
# Java 8 style
LOGGING_OPTS="$LOGGING_OPTS -Xloggc:$CATALINA_HOME/logs/gc.log"
LOGGING_OPTS="$LOGGING_OPTS -XX:+PrintGCDetails"
LOGGING_OPTS="$LOGGING_OPTS -XX:+PrintGCDateStamps"
LOGGING_OPTS="$LOGGING_OPTS -XX:+PrintGCTimeStamps"
LOGGING_OPTS="$LOGGING_OPTS -XX:+UseGCLogFileRotation"
LOGGING_OPTS="$LOGGING_OPTS -XX:NumberOfGCLogFiles=10"
LOGGING_OPTS="$LOGGING_OPTS -XX:GCLogFileSize=10M"

# Java 9+ style (uncomment if using Java 9+, comment out Java 8 style above)
# LOGGING_OPTS="$LOGGING_OPTS -Xlog:gc*:file=$CATALINA_HOME/logs/gc.log:time,level,tags:filecount=10,filesize=10M"

# Heap dump on OutOfMemoryError
LOGGING_OPTS="$LOGGING_OPTS -XX:+HeapDumpOnOutOfMemoryError"
LOGGING_OPTS="$LOGGING_OPTS -XX:HeapDumpPath=$CATALINA_HOME/logs/"

# JMX for monitoring (optional - opens port 9090)
# JMX_OPTS="-Dcom.sun.management.jmxremote"
# JMX_OPTS="$JMX_OPTS -Dcom.sun.management.jmxremote.port=9090"
# JMX_OPTS="$JMX_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
# JMX_OPTS="$JMX_OPTS -Dcom.sun.management.jmxremote.ssl=false"


# ========== Security Options ==========

SECURITY_OPTS=""

# Headless mode (no GUI needed for server)
SECURITY_OPTS="$SECURITY_OPTS -Djava.awt.headless=true"

# Secure random number generator (faster but less secure - OK for ORDS)
SECURITY_OPTS="$SECURITY_OPTS -Djava.security.egd=file:/dev/./urandom"


# ========== Large Pages (Optional - Linux only) ==========

# Uncomment if you have huge pages configured on your system
# Can significantly improve performance for large heaps
# LARGEPAGES_OPTS="-XX:+UseLargePages"
# LARGEPAGES_OPTS="$LARGEPAGES_OPTS -XX:LargePageSizeInBytes=2m"


# ========== ORDS Specific Options ==========

ORDS_OPTS=""

# Oracle JDBC driver optimizations
ORDS_OPTS="$ORDS_OPTS -Doracle.jdbc.defaultNChar=true"
ORDS_OPTS="$ORDS_OPTS -Doracle.jdbc.autoCommitSpecCompliant=false"

# Connection pool implicit caching
ORDS_OPTS="$ORDS_OPTS -Doracle.jdbc.implicitStatementCacheSize=50"

# LOB prefetch size (helps with APEX BLOB handling)
ORDS_OPTS="$ORDS_OPTS -Doracle.jdbc.defaultLobPrefetchSize=8192"


# ========== Construct CATALINA_OPTS ==========

CATALINA_OPTS="-Xms${MIN_HEAP}"
CATALINA_OPTS="$CATALINA_OPTS -Xmx${MAX_HEAP}"
CATALINA_OPTS="$CATALINA_OPTS -XX:MetaspaceSize=${METASPACE_SIZE}"
CATALINA_OPTS="$CATALINA_OPTS -XX:MaxMetaspaceSize=${MAX_METASPACE}"
CATALINA_OPTS="$CATALINA_OPTS -XX:MaxDirectMemorySize=${MAX_DIRECT_MEMORY}"

CATALINA_OPTS="$CATALINA_OPTS $GC_ALGORITHM"
CATALINA_OPTS="$CATALINA_OPTS $GC_PARAMS"
CATALINA_OPTS="$CATALINA_OPTS $PERFORMANCE_OPTS"
CATALINA_OPTS="$CATALINA_OPTS $JIT_OPTS"
CATALINA_OPTS="$CATALINA_OPTS $NETWORK_OPTS"
CATALINA_OPTS="$CATALINA_OPTS $LOGGING_OPTS"
CATALINA_OPTS="$CATALINA_OPTS $SECURITY_OPTS"
CATALINA_OPTS="$CATALINA_OPTS $ORDS_OPTS"
# CATALINA_OPTS="$CATALINA_OPTS $LARGEPAGES_OPTS"  # Uncomment if using large pages
# CATALINA_OPTS="$CATALINA_OPTS $JMX_OPTS"  # Uncomment if using JMX

export CATALINA_OPTS

# Optional: Set JAVA_OPTS for additional JVM options
# JAVA_OPTS are used by both startup and shutdown scripts
# export JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"


################################################################################
# Monitoring and Troubleshooting
################################################################################
#
# 1. Check GC logs:
#    tail -f $CATALINA_HOME/logs/gc.log
#
# 2. Monitor JVM memory:
#    jstat -gcutil <pid> 1000
#
# 3. Check thread usage:
#    jstack <pid> | grep "java.lang.Thread.State" | sort | uniq -c
#
# 4. Heap dump analysis:
#    jmap -dump:format=b,file=heap.bin <pid>
#    Use Eclipse MAT or VisualVM to analyze
#
# 5. Live monitoring:
#    jconsole <pid>  # or use VisualVM
#
################################################################################

################################################################################
# Tuning Process
################################################################################
#
# 1. Start with conservative settings (4-8 GB heap)
# 2. Run load tests and monitor GC logs
# 3. Look for:
#    - Long GC pause times (> 200ms)
#    - Frequent Full GCs
#    - OutOfMemoryErrors
# 4. Adjust heap size:
#    - If frequent Full GC: increase heap
#    - If long young GC: adjust G1 region size
#    - If metaspace OOM: increase metaspace
# 5. Re-test and iterate
#
################################################################################

echo "JVM Options configured for ORDS/APEX:"
echo "Min Heap: $MIN_HEAP"
echo "Max Heap: $MAX_HEAP"
echo "GC Algorithm: $GC_ALGORITHM"
echo "Full CATALINA_OPTS: $CATALINA_OPTS"
