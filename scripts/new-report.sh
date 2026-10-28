#!/bin/bash
NUM=$1
NAME=$2
MITRE=$3
REPORT_DIR=~/wazuh-soc-lab/reports
TEMPLATE=~/wazuh-soc-lab/templates/report-template.md

if [ -z "$NUM" ] || [ -z "$NAME" ]; then
  echo "Usage: ./new-report.sh <num> <name> <mitre>"
  echo "Example: ./new-report.sh 01 ssh-brute-force T1110"
  exit 1
fi

mkdir -p $REPORT_DIR
CURRENT_DATE=$(date +%Y-%m-%d)

# Replace placeholders using sed
sed -e "s/\[NUM\]/$NUM/g" \
    -e "s/\[ATTACK NAME\]/$NAME/g" \
    -e "s/\[TXXXX\]/$MITRE/g" \
    -e "s/\[DATE\]/$CURRENT_DATE/g" \
    $TEMPLATE > $REPORT_DIR/${NUM}-${NAME}.md

mkdir -p ~/wazuh-soc-lab/screenshots/$NUM

echo "✅ Report created: $REPORT_DIR/${NUM}-${NAME}.md"
echo "📁 Screenshots folder: ~/wazuh-soc-lab/screenshots/$NUM/"
