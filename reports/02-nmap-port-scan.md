# Incident Report: nmap-port-scan

**Report ID:** IR-02  
**Date:** 2026-10-27  
**Analyst:** Lekhraj Dheerani  

## 1. Executive Summary
On October 27, 2026, a simulated Nmap port scan was executed against the localhost (Kali Linux). The Wazuh SIEM successfully detected the scan using custom rule 100003. The rule triggered when multiple SSH connections were abruptly closed by the authenticating user (`Connection closed by authenticating user`), which is a common behavior during service scanning. The activity was logged, and a high-severity alert was generated.

## 2. Attack Details
| Field | Value |
|-------|-------|
| Attack Type | Nmap Port Scan (SSH) |
| Source IP | 127.0.0.1 (Localhost) |
| Target | Kali Linux (localhost) |
| Port | 22 (SSH) |
| Duration | ~20 seconds |
| Attempts | 6+ connection attempts |

## 3. Detection
**Rule ID:** 100003  
**Rule Level:** 10  
**Rule File:** `local_rules.xml`  
**MITRE ATT&CK:** T1046  

### Rule Logic
```xml
<rule id="100003" level="10">
  <if_group>sshd</if_group>
  <match>Connection closed by authenticating user</match>
  <description>Custom: Nmap Scan Detected.</description>
  <mitre>
    <id>T1046</id>
  </mitre>
</rule>
