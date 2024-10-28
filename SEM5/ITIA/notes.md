# IT Infrastructure Automation

## Logging

**Um was geht es beim Logging?:**

- Aktivitäten
- Ereignisse 
- Parameter 
- Betriebszustände / Status 


**Ist immer in einem Kontext:** 

- Ziele
- Datenquellen 
- Sammelart 
- Filtern und Normalisieren 
- Korrelation und Analytics 
- Abnehmer


**Mit welchem Ziel:** 

- Kosten / Ressourcennutzung optimieren 
- Security - Annomalien 
- Keine spezifischen einfach default (Windows Events)
- Gezielt, selektiv, je nach Quelle, Abnehmer Rückschlüsse ziehen
- Kontrollieren ob Automatisierungsaufgabe Erfolg hatte 
- Weil es Teil des Aufgabengebites ist, z.B. SOC
- Aufdecken von Sicherheitsvorfällen (Login-fails)


**Informationsquellen:** 

- Server, PC 
- Router, Switch 
- Firewall, Proxy, ALG's 
- DNS, Mail-, Web-Server


## Automatisierungstools 

Sollten immer deklarativ sein.

Verbreitete Automatisierungstools sind Ansible, Puppet, Chef


### Ablauf

ist immer derselbe 

1. Endzustand wird definiert (z.B. webserver installieren)
2. Wenn Zielzustand vorhanden, nichts machen
3. Ansonsten Zielzustand erreichen


### Warum

Schneller, konsistenter, Menschenfehler ausmertzen 


### Statische Hosts:

```
[usa]
washington1.example.com
washington2.example.com

[canada]
ontario1.example.com
ontario2.example.com

[north-americ:children]
usa
canada
```

## Begriffe 

- **Deklarativ:** legt Zielzustand fest nicht den weg dahin (nicht wie Bash)
- **Idempotenz:** Endzustand ist immer derselbe, egal ob der Web mehrmals ausgeführt wird.
- Inventar definiert Sammlung von Hosts, welche Ansible verwaltet (SSH Zieladresse) mit plugins auch dynamisch möglich



