# Apache Tomcat Performance Optimization for Oracle APEX Page Designer

## 1. JVM Memory Settings (setenv.sh)

Add or modify in `$CATALINA_HOME/bin/setenv.sh`:

```bash
#!/bin/bash

# Heap Size - Adjust based on available system memory
# For systems with 8GB+: Use -Xms4g -Xmx8g
# For systems with 16GB+: Use -Xms8g -Xmx12g
export CATALINA_OPTS="$CATALINA_OPTS -Xms4g -Xmx8g"

# Use G1 Garbage Collector for better performance with large heaps
export CATALINA_OPTS="$CATALINA_OPTS -XX:+UseG1GC"
export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxGCPauseMillis=200"

# Optimize for server workloads
export CATALINA_OPTS="$CATALINA_OPTS -server"

# Enable compressed oops (64-bit JVM optimization)
export CATALINA_OPTS="$CATALINA_OPTS -XX:+UseCompressedOops"

# GC Logging (optional, for monitoring)
export CATALINA_OPTS="$CATALINA_OPTS -Xlog:gc*:file=/var/log/tomcat/gc.log:time,uptime:filecount=5,filesize=10M"

# Enable JMX monitoring (optional)
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.port=9999"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
```

## 2. server.xml Optimizations

### Connector Configuration

Modify the HTTP connector in `$CATALINA_HOME/conf/server.xml`:

```xml
<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           maxThreads="300"
           minSpareThreads="50"
           acceptCount="200"
           maxConnections="10000"
           compression="on"
           compressionMinSize="2048"
           compressableMimeType="text/html,text/xml,text/css,text/javascript,application/javascript,application/json,application/xml"
           maxPostSize="52428800"
           maxParameterCount="10000"
           redirectPort="8443"
           enableLookups="false"
           disableUploadTimeout="true"
           URIEncoding="UTF-8" />
```

### Executor Configuration

Add executor for shared thread pool:

```xml
<Executor name="tomcatThreadPool"
          namePrefix="catalina-exec-"
          maxThreads="300"
          minSpareThreads="50"
          maxIdleTime="60000"/>
```

## 3. Context Configuration (context.xml)

Optimize session management in `$CATALINA_HOME/conf/context.xml`:

```xml
<Context>
    <!-- Session Management -->
    <Manager className="org.apache.catalina.session.StandardManager"
             maxActiveSessions="1000"
             processExpiresFrequency="6"
             maxInactiveInterval="3600" />
    
    <!-- Resource Caching -->
    <Resources cachingAllowed="true"
               cacheMaxSize="100000"
               cacheObjectMaxSize="51200"
               cacheTTL="3600000" />
    
    <!-- JAR Scanning Optimization -->
    <JarScanner scanClassPath="false"
                scanManifest="false"
                scanBootstrapClassPath="false" />
</Context>
```

## 4. web.xml Optimizations

Add compression and caching filters in `$CATALINA_HOME/conf/web.xml`:

```xml
<!-- Compression Filter -->
<filter>
    <filter-name>CompressionFilter</filter-name>
    <filter-class>org.apache.catalina.filters.CompressionFilter</filter-class>
    <init-param>
        <param-name>compression</param-name>
        <param-value>on</param-value>
    </init-param>
    <init-param>
        <param-name>compressionMinSize</param-name>
        <param-value>2048</param-value>
    </init-param>
</filter>

<!-- Expires Filter for Static Content -->
<filter>
    <filter-name>ExpiresFilter</filter-name>
    <filter-class>org.apache.catalina.filters.ExpiresFilter</filter-class>
    <init-param>
        <param-name>ExpiresByType text/css</param-name>
        <param-value>access plus 1 month</param-value>
    </init-param>
    <init-param>
        <param-name>ExpiresByType application/javascript</param-name>
        <param-value>access plus 1 month</param-value>
    </init-param>
    <init-param>
        <param-name>ExpiresByType image/png</param-name>
        <param-value>access plus 1 year</param-value>
    </init-param>
    <init-param>
        <param-name>ExpiresByType image/jpeg</param-name>
        <param-value>access plus 1 year</param-value>
    </init-param>
</filter>
```

## 5. System-level Optimizations

### Increase File Descriptor Limit

Add to `/etc/security/limits.conf`:
```
tomcat soft nofile 65535
tomcat hard nofile 65535
```

### TCP/IP Optimizations

Add to `/etc/sysctl.conf`:
```bash
# TCP buffer sizes
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216

# TCP connection queue
net.core.somaxconn = 1024
net.ipv4.tcp_max_syn_backlog = 2048

# Keep-alive settings
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_probes = 3
net.ipv4.tcp_keepalive_intvl = 15

# Enable TCP fast open
net.ipv4.tcp_fastopen = 3
```

Apply with: `sudo sysctl -p`

## 6. Application-specific Optimizations

### Disable Unused Web Applications

Remove or disable unused web applications in `$CATALINA_HOME/webapps/`

### Enable Parallel Deployment

In `server.xml`, add:
```xml
<Host name="localhost" appBase="webapps" 
      unpackWARs="true" autoDeploy="false"
      parallelProcessingTimeout="0">
```

## 7. Monitoring and Tuning

### Enable Access Logging (for analysis)

In `server.xml`:
```xml
<Valve className="org.apache.catalina.valves.AccessLogValve"
       directory="logs"
       prefix="localhost_access_log"
       suffix=".txt"
       pattern="%h %l %u %t &quot;%r&quot; %s %b %D"
       fileDateFormat="yyyy-MM-dd" />
```

Note: Monitor the `%D` (time in milliseconds) to identify slow requests.

## 8. Restart After Changes

After making changes:
```bash
sudo systemctl restart tomcat
# or
$CATALINA_HOME/bin/shutdown.sh
$CATALINA_HOME/bin/startup.sh
```

## 9. Verification

Check JVM settings:
```bash
ps aux | grep java
```

Monitor thread pool usage via JMX or:
```bash
curl http://localhost:8080/manager/status
```
