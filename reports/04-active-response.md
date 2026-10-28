# Incident Report: Active Response (Auto-Block)

**Report ID:** IR-04  
**Date:** 2026-10-28  
**Analyst:** Lekhraj Dheerani  

## 1. Executive Summary
On October 28, 2026, a simulated SSH brute-force attack was executed against localhost (127.0.0.1) to test Wazuh's Active Response capability. After 7 consecutive failed login attempts, Wazuh's custom rule 100001 triggered an automated defense mechanism. The `firewall-drop` script was executed by the Wazuh manager, which immediately added an iptables rule to block the attacker's IP (127.0.0.1) for 600 seconds. Subsequent connection attempts resulted in a "Connection timed out" error, confirming the block was successful. The IP was later manually unblocked by the analyst to restore local testing.

## 2. Attack Details
| Field | Value |
|-------|-------|
| Attack Type | SSH Brute Force |
| Source IP | 127.0.0.1 (Blocked) |
| Target | Kali Linux (localhost) |
| Port | 22 (SSH) |
| Attack Command | `sshpass` loop (7 attempts) |
| Auto-Block Time | 600 seconds |

## 3. Detection & Response
**Rule ID:** 100001 (SSH Failed Login)  
**Rule Level:** 10  
**Rule File:** `local_rules.xml`  
**MITRE ATT&CK:** T1110 (Brute Force)  

### Active Response Configuration
```xml
<command>
  <name>firewall-drop</name>
  <executable>firewall-drop</executable>
  <timeout_allowed>yes</timeout_allowed>
</command>

<active-response>
  <disabled>no</disabled>
  <command>firewall-drop</command>
  <location>local</location>
  <rules_id>100001,100002</rules_id>
  <timeout>600</timeout>
</active-response>



### Verification (Proof from Screenshot)
The following evidence confirms the block was active:
1. **Connection Timed Out:** During the attack loop, subsequent SSH attempts failed with `Connection timed out`.
2. **iptables Rule:** The command `sudo iptables -L INPUT -v -n | grep 127.0.0.1` showed:
   ```text
   DROP  all  --  127.0.0.1  0.0.0.0/0
