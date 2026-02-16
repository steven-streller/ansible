# 🛠 SRE & DevOps Glossar

## 1️⃣ Incident Management

| Begriff | Erklärung |
|---------|-----------|
| Incident | Ein unvorhergesehenes Ereignis, das den normalen Betrieb eines Services unterbricht |
| Severity / Sev | Klassifizierung eines Incidents nach Auswirkung auf Service (z.B. Sev1 = kritischer Ausfall) |
| War Room | Virtueller oder physischer Raum, in dem ein Incident koordiniert und gelöst wird |
| Pager / On-Call | Bereitschaftsdienst für kritische Systeme, der bei Alerts alarmiert wird |
| Escalation | Weiterleitung eines Incidents an höhere Support- oder Führungsebene |
| Postmortem / Retrospektive | Analyse nach Incident: Ursachen, Auswirkungen, Maßnahmen |
| Root Cause Analysis (RCA) | Untersuchung der Hauptursache eines Problems, um Wiederholung zu verhindern |
| Mitigation | Sofortige Maßnahme zur Reduzierung der Auswirkungen eines Incidents |
| Recovery | Maßnahmen zur Wiederherstellung des normalen Servicebetriebs |
| Runbook | Dokumentierte Schritt-für-Schritt-Anleitungen zur Lösung bekannter Incidents |

## 2️⃣ SRE-Kernkonzepte

| Begriff | Erklärung |
|---------|-----------|
| SLO (Service Level Objective) | Konkretes Ziel für Verfügbarkeit, Latenz, Durchsatz oder Fehlerquote eines Service |
| SLA (Service Level Agreement) | Vertraglich vereinbarte Garantien für Servicequalität gegenüber Kunden |
| SLI (Service Level Indicator) | Messbare Kennzahl zur Überwachung eines SLO (z.B. 99,9% Requests erfolgreich) |
| Error Budget | Maximal tolerierbarer Anteil von Fehlern oder Ausfallzeit für einen Service |
| Blameless Culture | Fokus auf Lernen und Verbesserung statt Schuldzuweisung bei Incidents |
| Post-Incident Review | Analyse nach einem Vorfall, Lessons Learned, Dokumentation von Maßnahmen |

## 3️⃣ DevOps / Deployment

| Begriff | Erklärung |
|---------|-----------|
| CI/CD | Continuous Integration / Continuous Deployment: Automatisierter Build-Test-Deploy-Prozess |
| Canary Deployment | Schrittweises Ausrollen neuer Versionen auf kleine Nutzergruppe |
| Blue-Green Deployment | Parallelbetrieb alter & neuer Version, nahtloser Wechsel |
| Rollback | Zurücksetzen auf vorherige stabile Version |
| Feature Flag | Neue Features temporär ein-/ausschalten ohne Deployment |
| Infrastructure as Code (IaC) | Infrastruktur wird wie Software definiert und versioniert (z.B. Terraform, Ansible) |
| GitOps | CI/CD + IaC: Änderungen an Infrastruktur via Git-Pull Requests |

## 4️⃣ Monitoring & Observability

| Begriff | Erklärung |
|---------|-----------|
| Monitoring | Überwachung von Systemmetriken (CPU, RAM, Disk, Netzwerk) |
| Alerting | Automatische Benachrichtigung bei Überschreitung definierter Schwellenwerte |
| Observability | Fähigkeit, Zustand und Verhalten eines Systems aus Logs, Metriken, Traces zu verstehen |
| Metrics / Metriken | Messbare Werte wie Response Time, Error Rate, CPU Usage |
| Logs | Ereignisprotokolle von Systemen oder Anwendungen |
| Tracing | Verfolgung des Pfads einzelner Requests durch Systeme (z.B. Jaeger, OpenTelemetry) |
| Dashboard | Visualisierung von Metriken & Logs (z.B. Grafana) |
| Health Check | Prüft, ob Service korrekt läuft und Anfragen bedienen kann |

## 5️⃣ SRE Operations / Tools

| Begriff | Erklärung |
|---------|-----------|
| War Room | Zentraler Ort zur Koordination kritischer Incidents |
| Incident Commander | Person, die Incident aktiv steuert und Entscheidungen trifft |
| Postmortem Template | Standardisierte Struktur für Incident-Analyse |
| Runbook Automation | Automatisierte Schritte aus Runbooks ausführen (z.B. Scripts für Recovery) |
| Chaos Engineering | Geplante Störungen zur Überprüfung der Resilienz |
| Load Balancer | Verteilt Traffic auf mehrere Instanzen für High Availability |
| Auto-Scaling | Dynamische Anpassung von Ressourcen bei Laständerungen |
| Redundancy / HA | Mehrfach vorhandene Systeme für Ausfallsicherheit |
| Backup / DR | Sicherungen + Disaster Recovery-Strategie |

## 6️⃣ Sonstiges / Begriffe im SRE-Alltag

| Begriff | Erklärung |
|---------|-----------|
| KPI | Key Performance Indicator – Leistungskennzahl eines Services |
| MTTR | Mean Time To Repair – durchschnittliche Wiederherstellungszeit nach Ausfall |
| MTTF | Mean Time To Failure – durchschnittliche Zeit bis zum Ausfall eines Systems |
| MTBF | Mean Time Between Failures – durchschnittliche Zeit zwischen Ausfällen |
| SLA Breach | Verstoß gegen Service Level Agreement |
| Change Management | Planen, Testen, Dokumentieren und Freigeben von Änderungen an Produktionssystemen |
| Alert Fatigue | Erschöpfung durch zu viele Benachrichtigungen / false positives |
| PagerDuty / OpsGenie | Tools zur Alarmierung & On-Call-Verwaltung |


# 🚨 SRE Incident Handling Cheat Sheet

## 1️⃣ Incident Lifecycle

| Schritt | Beschreibung |
|---------|--------------|
| Detection / Alert | Ein Monitoring-Tool oder Nutzer meldet einen Incident. Alerts können via PagerDuty, OpsGenie, Slack etc. kommen. |
| Classification / Severity | Incident wird nach Auswirkung klassifiziert (Sev1 = kritisch, Sev2 = hoch, Sev3 = mittel, Sev4 = niedrig). |
| Notification / Escalation | Benachrichtigung des On-Call Engineers oder Incident Commander. Eskalation bei Sev1/Sev2. |
| War Room | Virtueller oder physischer Raum, in dem Incident koordiniert wird (alle Beteiligten zusammen). |
| Mitigation | Sofortmaßnahmen, um die Auswirkungen zu reduzieren (z.B. Traffic auf Backup umleiten, fehlerhafte Instanz stoppen, Hotfix einspielen). |
| Investigation / Root Cause Analysis (RCA) | Ursachenanalyse: Logs prüfen, Monitoring-Daten auswerten, Konfiguration und Infrastruktur analysieren. Ziel: Hauptursache finden. |
| Resolution / Recovery | Service wiederherstellen. Schritte können Restart, Rollback, Scaling, Patch Deployment sein. |
| Verification / Validation | Überprüfen, dass Service stabil läuft und Fehler behoben sind. Health Checks, Monitoring, Test Requests. |
| Post-Incident Review / Postmortem | Dokumentation des Incidents: Timeline, Ursachen, getroffene Maßnahmen, Lessons Learned. |

---

## 2️⃣ Typische Begriffe & Aktionen

| Begriff | Erklärung |
|---------|-----------|
| Incident Commander | Verantwortlich für Steuerung des Incidents, Entscheidungen treffen, Kommunikation koordinieren |
| Mitigation | Sofortmaßnahmen zur Minimierung der Auswirkungen eines Incidents |
| Resolution | Endgültige Behebung des Problems, sodass Service wieder normal läuft |
| Root Cause / RCA | Primäre Ursache des Problems, die langfristig behoben werden muss |
| Runbook | Schritt-für-Schritt-Anleitungen für bekannte Incidents oder Standardmaßnahmen |
| Blameless Postmortem | Analyse ohne Schuldzuweisung, Fokus auf Lernen und Verbesserung |
| Change / Deployment | Eventuell notwendige Konfigurationsänderungen oder Software-Updates zur Behebung |
| Communication | Updates an Stakeholder, Kunden oder interne Teams während des Incidents |
| Recovery Point | Zeitpunkt, auf den man Daten oder Systeme wiederherstellt (z.B. Backup) |
| Recovery Time | Dauer, bis der Service wieder verfügbar ist (MTTR) |

---

## 3️⃣ Incident Workflow (Schnellübersicht)

1. **Alert erhalten** → Prüfen der Severity  
2. **War Room öffnen** → On-Call + Incident Commander koordinieren  
3. **Mitigation starten** → Sofortmaßnahmen zur Stabilisierung  
4. **Investigation** → Logs, Metriken, Traces prüfen  
5. **Resolution** → Hotfix, Rollback, Reboot, Scaling, Config-Change  
6. **Verify** → Health Checks, Monitoring-Alerts prüfen  
7. **Postmortem** → Ursachen, Timeline, Lessons Learned dokumentieren  
8. **Preventive Measures** → Runbook aktualisieren, Monitoring/Alerts anpassen  

---

## 4️⃣ Praktische Tipps für SRE

- **Severity richtig setzen** → wirkt auf Eskalation, Priorisierung, Ressourcen.  
- **Kommunikation ist Key** → Stakeholder immer up-to-date halten.  
- **Mitigation zuerst, Root Cause danach** → Stoppe Impact, bevor du Ursachen analysierst.  
- **Monitoring & Alerts** → Nutze Grafana/Prometheus oder ELK, um schnell Trends und Anomalien zu erkennen.  
- **Blameless Culture** → Fokus auf Prozesse, nicht auf Personen.  
- **Lessons Learned** → Immer Runbooks aktualisieren, so dass gleiche Incidents schneller gelöst werden können.  
