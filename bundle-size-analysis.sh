#!/bin/bash
# Bundle Size Analysis for Oracle APEX Page Designer
# This script analyzes JavaScript and CSS bundle sizes

# ============================================================================
# Configuration
# ============================================================================

APEX_STATIC_DIR="${APEX_STATIC_DIR:-/i/}"
TOMCAT_WEBAPPS="${TOMCAT_WEBAPPS:-/opt/tomcat/webapps}"
OUTPUT_DIR="/tmp/bundle-analysis"
mkdir -p "$OUTPUT_DIR"

# ============================================================================
# Function: Analyze APEX Static Files
# ============================================================================

function analyze_apex_static_files() {
    echo "=== Analyzing APEX Static Files ==="
    
    # Find JavaScript files
    echo "JavaScript Files:"
    echo "----------------"
    find "$TOMCAT_WEBAPPS" -name "*.js" -type f ! -name "*.min.js" | while read file; do
        size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        size_kb=$((size / 1024))
        echo "$size_kb KB - $file"
    done | sort -rn | head -20 > "$OUTPUT_DIR/js_files.txt"
    cat "$OUTPUT_DIR/js_files.txt"
    
    # Find CSS files
    echo ""
    echo "CSS Files:"
    echo "----------"
    find "$TOMCAT_WEBAPPS" -name "*.css" -type f ! -name "*.min.css" | while read file; do
        size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        size_kb=$((size / 1024))
        echo "$size_kb KB - $file"
    done | sort -rn | head -20 > "$OUTPUT_DIR/css_files.txt"
    cat "$OUTPUT_DIR/css_files.txt"
}

# ============================================================================
# Function: Analyze Minified Files
# ============================================================================

function analyze_minified_files() {
    echo ""
    echo "=== Analyzing Minified Files ==="
    
    echo "Minified JavaScript:"
    find "$TOMCAT_WEBAPPS" -name "*.min.js" -type f | while read file; do
        size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        size_kb=$((size / 1024))
        echo "$size_kb KB - $(basename $file)"
    done | sort -rn | head -20
    
    echo ""
    echo "Minified CSS:"
    find "$TOMCAT_WEBAPPS" -name "*.min.css" -type f | while read file; do
        size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        size_kb=$((size / 1024))
        echo "$size_kb KB - $(basename $file)"
    done | sort -rn | head -20
}

# ============================================================================
# Function: Check for Compression
# ============================================================================

function check_compression() {
    echo ""
    echo "=== Checking File Compression ==="
    
    # Check if files are gzipped
    echo "Testing compression on largest JS file..."
    largest_js=$(find "$TOMCAT_WEBAPPS" -name "*.js" -type f -exec ls -S {} \; | head -1)
    if [ -n "$largest_js" ]; then
        original_size=$(stat -f%z "$largest_js" 2>/dev/null || stat -c%s "$largest_js" 2>/dev/null)
        gzipped_size=$(gzip -c "$largest_js" 2>/dev/null | wc -c)
        if [ "$gzipped_size" -gt 0 ]; then
            compression_ratio=$((100 - (gzipped_size * 100 / original_size)))
            echo "File: $(basename $largest_js)"
            echo "Original: $((original_size / 1024)) KB"
            echo "Gzipped: $((gzipped_size / 1024)) KB"
            echo "Compression: ${compression_ratio}%"
        fi
    fi
}

# ============================================================================
# Function: Analyze Network Waterfall (if access logs available)
# ============================================================================

function analyze_access_logs() {
    echo ""
    echo "=== Analyzing Access Logs ==="
    
    ACCESS_LOG="${ACCESS_LOG:-/opt/tomcat/logs/localhost_access_log.*.txt}"
    
    if ls $ACCESS_LOG 1> /dev/null 2>&1; then
        echo "Analyzing resource loading patterns..."
        
        # Find largest resources loaded
        echo "Largest resources by size:"
        grep -E '\.(js|css)$' $ACCESS_LOG | awk '{print $NF, $0}' | sort -rn | head -10
        
        # Find slowest loading resources
        echo ""
        echo "Slowest loading resources (>1000ms):"
        grep -E '\.(js|css)$' $ACCESS_LOG | awk '{if ($NF > 1000) print $NF "ms - " $0}' | sort -rn | head -10
    else
        echo "Access logs not found at $ACCESS_LOG"
    fi
}

# ============================================================================
# Function: Generate Recommendations
# ============================================================================

function generate_recommendations() {
    echo ""
    echo "=== Recommendations ==="
    
    # Check total bundle size
    total_js=$(find "$TOMCAT_WEBAPPS" -name "*.js" -type f -exec stat -f%z {} \; 2>/dev/null | awk '{sum+=$1} END {print sum}')
    total_css=$(find "$TOMCAT_WEBAPPS" -name "*.css" -type f -exec stat -f%z {} \; 2>/dev/null | awk '{sum+=$1} END {print sum}')
    
    if [ -z "$total_js" ]; then
        total_js=$(find "$TOMCAT_WEBAPPS" -name "*.js" -type f -exec stat -c%s {} \; 2>/dev/null | awk '{sum+=$1} END {print sum}')
    fi
    
    if [ -z "$total_css" ]; then
        total_css=$(find "$TOMCAT_WEBAPPS" -name "*.css" -type f -exec stat -c%s {} \; 2>/dev/null | awk '{sum+=$1} END {print sum}')
    fi
    
    total_kb=$(( (total_js + total_css) / 1024 ))
    
    echo "Total JS/CSS size: ${total_kb} KB"
    
    if [ "$total_kb" -gt 5000 ]; then
        echo "⚠️  Total bundle size is large (>5MB). Consider:"
        echo "   - Code splitting"
        echo "   - Lazy loading"
        echo "   - Removing unused code"
    elif [ "$total_kb" -gt 2000 ]; then
        echo "⚠️  Bundle size is moderate (2-5MB). Consider optimization."
    else
        echo "✓ Bundle size is reasonable."
    fi
    
    # Check for minification
    minified_count=$(find "$TOMCAT_WEBAPPS" -name "*.min.js" -o -name "*.min.css" | wc -l)
    non_minified_count=$(find "$TOMCAT_WEBAPPS" -name "*.js" ! -name "*.min.js" -o -name "*.css" ! -name "*.min.css" | wc -l)
    
    if [ "$non_minified_count" -gt "$minified_count" ]; then
        echo ""
        echo "⚠️  Many files are not minified. Enable minification for production."
    fi
    
    # Check for source maps in production
    sourcemap_count=$(find "$TOMCAT_WEBAPPS" -name "*.map" | wc -l)
    if [ "$sourcemap_count" -gt 0 ]; then
        echo ""
        echo "ℹ️  Source maps found. Consider removing in production for smaller bundle size."
    fi
}

# ============================================================================
# Function: Create Bundle Analysis Report
# ============================================================================

function create_report() {
    REPORT_FILE="$OUTPUT_DIR/bundle_analysis_report.txt"
    
    {
        echo "Oracle APEX Page Designer Bundle Analysis Report"
        echo "Generated: $(date)"
        echo "================================================"
        echo ""
        analyze_apex_static_files
        echo ""
        analyze_minified_files
        echo ""
        check_compression
        echo ""
        generate_recommendations
    } > "$REPORT_FILE"
    
    echo ""
    echo "Report saved to: $REPORT_FILE"
}

# ============================================================================
# Main Execution
# ============================================================================

if [ "$1" == "report" ]; then
    create_report
else
    analyze_apex_static_files
    analyze_minified_files
    check_compression
    analyze_access_logs
    generate_recommendations
fi
