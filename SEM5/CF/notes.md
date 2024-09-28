# Computer Forensics

## Allgemein

- Bericht machen und präsentieren
- gibt keine Note, nur bestanden/nicht bestanden 
- Entscheidung basiert auf Bericht
    - Laborheft notewending
    - Wenn Bericht nicht klar ist wird Laborheft konsultiert
    - Primär zählt Methode und Schlussfolgerungen, nicht alle Lösungen gefunden.
- Rückmeldung gibt es ein Gespräch, keine Note



## Content

**Was ist Forensik?**

Wir haben einen Vorfall, Ziel ist es, das ursprüngliche Event zu nachvolziehen

1. Detection
2. Recognition
3. Recovery
4. Examination
5. Interpretation
6. Understand Event
7. Reporting


**Spur:**

1. Wird durch Ereignis erzeugt
2. Lässt Rücjschlüsse auf Ereignis zu 
3. Kann zum Beweismittel werden


### Reporting

- Zielpersonen sind nicht Fachpersonen 
- Fachperson müsste nachvolziehen können, wie dass das Resultat erhalten wurde 
- Bericht muss vereinfacht werden, ohne dass der Inhalt falsch wird


**Anforderungen an Bericht:** 

- Autorenname
- Organisation
- Fall
- Datum
- Seitennummer / Gesamtanzahl der Seiten 


**Berichtstruktur:** 

| Abschnitt                | Inhalt des Abschnitts                 |
|--------------------------|---------------------------------------|
| Titelseite               | Um welchen Bericht handelt es sicht   |
| Einleitung               | Kontext des Berichts                  |
| Beschreibung der Objekte | Ausgangslage                          |
| Methode                  | Prozess                               |
| Resultate                | Ergebnisse                            |
| Diskussion               | Bedeutung der Ergebnisse              |
| Schlussfolgerungen       | Zusammenfassung des gesamten Berichts |
| Literatur                | essentielle Referenzen                |
| Anhänge                  | inhalte um Details nachzuschauen      |


### Detection 

- Finden von Daten
    - Erfordert Kreativität 
    - Welche Geräte könnten einen Datenträger enthalten
- Dokumentation
    - Wo wurden Datenträger gefunden 
    - Welche Harddisks wurden bereits bearbeitet
- Datenträger priorisieren basierend auf: 
    - Erwartete Fallrelevanz
    - Analyse Schwierigkeit


## Übungen

Bearbeitung von Übungen aus dem Unterricht.


### Serie 01

- Welche fallrelevanten Spuren auf dem Computer sind zu erwarten?
- Welche Schwierigkeiten könnten auftreten?


**SOMMER Noah Rezepte gefälscht:** 

- PDF's / Word files von Rezepten und Zeugnissen
- Liste/Namen von Kunden
- Falls Applikation offen: Kommunikation

- FDE 


**Drogen an Flughafen in Koffer:** 

- Liste von Kunden 
- Liste von Vorrat
- Falls Applikation offen: Kommunikation

- FDE


**Ransomware Angriff auf mittelgrosse Firma:** 

- Applikation/Virus 
- Windows log-Dateien 

- Verschlüsselte Festplatte (Ransomware)


**PC in Wohnung von Leiche:** 

- Web-Cam 
- Drohungen / Kommunikation 
- Log Dateien (Shutdown)

- Mit Log Dateien Zeitpunkt immer noch ungewiss (auch wenn oft genutzter PC)
- FDE 



