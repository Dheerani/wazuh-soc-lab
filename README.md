# SOC Analyst Portfolio — Wazuh Lab

## About Me
Aspiring SOC Analyst with hands-on experience in Wazuh SIEM, custom detection rules, MITRE ATT&CK mapping, and incident response.

## Lab Environment
- **SIEM:** Wazuh 4.14.7
- **Attacker:** Kali Linux
- **Target:** Kali (localhost)
- **Web Server:** Apache2
- **Honeypot:** Cowrie (Docker, Port 2222)
- **Alerting:** Discord Webhook
- **Log Ingestion:** `auth.log`, `cowrie.json`

## Detections Implemented

| # | Detection | Rule ID | MITRE | Status |
|---|-----------|---------|-------|--------|
| 1 | SSH Brute Force | 100001, 100002 | T1110 | ✅ |
| 2 | Nmap Scan | 100003 | T1046 | ✅ |
| 3 | Cowrie Honeypot Login | 100500, 100501, 100502 | T1078, T1110 | ✅ |
| 4 | Active Response (Auto-Block) | firewall-drop | T1110 | ✅ |
| 5 | Discord Alerting | Webhook Integration | — | ✅ |

## Reports

| # | Report | Attack Type | Alerts | PDF |
|---|--------|-------------|--------|-----|
| 1 | [SSH Brute Force](reports/01-ssh-brute-force.md) | Brute Force | 19 | [PDF](reports/01-ssh-brute-force.pdf) |
| 2 | [Nmap Port Scan](reports/02-nmap-port-scan.md) | Recon | 7 | [PDF](reports/02-nmap-port-scan.pdf) |
| 3 | [Cowrie Honeypot](reports/03-cowrie-honeypot.md) | Honeypot | 2 | [PDF](reports/03-cowrie-honeypot.pdf) |
| 4 | [Active Response](reports/04-active-response.md) | Auto-Block | 100+ | [PDF](reports/04-active-response.pdf) |
| 5 | [Discord Alerting](reports/05-discord-alerting.md) | Real-Time Alert | 50+ | [PDF](reports/05-discord-alerting.pdf) |

## Skills Demonstrated
- Wazuh installation & configuration
- Custom XML rule writing
- JSON log parsing & custom decoders (Cowrie)
- Active Response (firewall-drop)
- MITRE ATT&CK mapping
- Webhook integration (Discord)
- Incident report writing & PDF export
- Rule debugging & tuning

## Contact
- GitHub: Lekhraj Dheerani
- LinkedIn: https://www.linkedin.com/in/lekhraj-dheerani-910a91285/
# wazuh-soc-lab
