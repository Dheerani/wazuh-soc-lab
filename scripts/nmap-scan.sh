#!/bin/bash
echo "Starting Nmap Scan..."
nmap -sS -sV -p- -T4 localhost
echo "Done. Check Wazuh alerts (Rule 100003)"
