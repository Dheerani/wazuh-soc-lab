# Incident Report: cowrie-honeypot

**Report ID:** IR-03  
**Date:** 2026-10-28  
**Analyst:** Lekhraj Dheerani  

## 1. Executive Summary
On October 21, 2026, an SSH brute-force attack was detected against a Dockerized Cowrie Honeypot running on port 2222. The attacker (172.17.0.1) successfully logged in using credentials `root:admin` (which the honeypot accepts by design) and executed reconnaissance commands including `whoami`. Wazuh detected the activity via custom rules 100500 (successful login) and 100502 (command execution), both mapped to MITRE ATT&CK T1078 (Valid Accounts) and T1059 (Command Execution). No real system was compromised.

## 2. Attack Details
| Field | Value |
|-------|-------|
| Attack Type | SSH Honeypot Login |
| Source IP | 172.17.0.1 |
| Target | Cowrie Honeypot (Docker) |
| Port | 2222 |
| Username | root |
| Password | admin |
| Commands | whoami, exit |

## 3. Detection
**Rule ID:** 100500, 100501, 100502  
**Rule Level:** 8, 8, 10  
**Rule File:** `local_rules.xml`  
**MITRE ATT&CK:** T1078 (Valid Accounts), T1110 (Brute Force), T1059 (Command Execution)

### Rule Logic
```xml
<rule id="100500" level="8">
  <field name="eventid">cowrie.login.success</field>
  <description>Cowrie: Successful Honeypot Login</description>
  <mitre>
    <id>T1078</id>
  </mitre>
</rule>
