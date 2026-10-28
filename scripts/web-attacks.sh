#!/bin/bash
TARGET="http://localhost"
echo "Starting Web Attacks..."
curl -s "$TARGET/?q=<script>alert(1)</script>" > /dev/null
echo "[1] XSS sent"
curl -s "$TARGET/?id=1' OR '1'='1" > /dev/null
echo "[2] SQLi sent"
curl -s "$TARGET/?file=../../../../etc/passwd" > /dev/null
echo "[3] Path Traversal sent"
echo "Done. Check Wazuh alerts"
