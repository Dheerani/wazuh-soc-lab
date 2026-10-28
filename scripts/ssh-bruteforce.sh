#!/bin/bash
echo "Starting SSH Brute Force..."
for i in {1..20}; do
  sshpass -p "wrongpass$i" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=2 wronguser@localhost 2>/dev/null
  echo "Attempt $i/20"
  sleep 1
done
echo "Done. Check Wazuh alerts (Rule 100002)"
