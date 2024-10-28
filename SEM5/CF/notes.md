# Computer Forensics

## Allgemein

- Bericht machen und präsentieren
- gibt keine Note, nur bestanden/nicht bestanden 
- Entscheidung basiert auf Bericht
    - Laborheft notwending
    - Wenn Bericht nicht klar ist wird Laborheft konsultiert
    - Primär zählt Methode und Schlussfolgerungen, nicht alle Lösungen gefunden.
- Rückmeldung gibt es ein Gespräch, keine Note


### Terminologie

**Sleep** 

- Gerät bleibt eingeschaltet
- Gerät führt keine Prozesse mehr aus
- Arbeitsspeicher in Gebrauch


**Hibernation** 

- Aktueller Zustand wird auf Harddisk gespeichert.
- Trennen von Stromquelle ändert nichts


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



## Acquisition

- Erstellen einer Kopie der Daten 
- "Save State"
- Analyse ab hier ohne physische Hardware


### Schritte bei Acquisition 
:
#### 1. Dokumentation

• Beschreibung des Geräts
    • Identifikatoren
• Ort des Geräts
• Zustand des Geräts
    • On / Off
    • Peripherals
    • Netzwerk-Kabel


#### 2. Läuft das Gerät? 

- Bildschirm, Ventilator, Elektronik-Geräusche 
- Bewegen der Maus
- Pressen einer Taste nicht mehr empfohlen


**Nein** 

- Transport ins Labor 
- Laptop: Ladekabel mitnehmen 
- Tower: 
    - Was habe ich für Equipment im Labor? 
    - Mac & Windows Peripherals sind nicht unbedingt kompatibel
    - Insb. Tastatur auf Mac 
- Offline Disk Kopie 
- Ansätze gegen Moores Law: 
    - Live Analyse -> direkt auf Disk 
    - Triage -> nach Kopie kurze Analyse entscheiden ob behalten wird 
    - Incremental Imaging
        - Optimale Speichernutzung 
        - Kopie wird in einzelne Dateien aufgesplittet
        - In Datenbank werden Metadaten gespeicher 
        - Tauchen in 2. Fall selbe Metadaten gefunden werden nur diese kopiert
        -







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


## Forensischer Prozess 

Automation:

- Recognition - not really 
- Preservation - Not really
- Acquisition - Easy 
- Examination - Easy 
- Interpretation - Hard 
- Reporting - Hard

### Datenverarbeitungs-pipeline 


1. Disk 
    - Acquisition 
2. Rohdaten 
     - Aufbereitung
3. Dargestellte Daten
    - Analyse 
4. Resultate 


### Acquisition 

- Lesen von Datenträger 
- Erstellen von Disk-Images 
- Live-Collection 
- Erstellen und Überprüfung von Hashes 


Spezifizierte Tools: 

- Exterro FTK Imager (intuitiv) 
- G(avenger?) - auf kali 
- Digital Collector


### Rohdaten 

Editor: hxd


### Dargestellte Daten 

File-System Ansicht: 

- X-Ways (sehr bekannt, kommerziell) 
- Exterro FTK 
- EnCase (war nicht so gut, solle besser sein)
- Autopsy - ist hybridtool 


Dinge die keine Dateien sind: 

- Inter-Partition Space $\rightarrow$ wird als eigene Partition dargestellt 
- Raum zwischen Dateien $\rightarrow$ wird als Datei dargestellt 
- File-Slack


### Event-Fokussierte Ansicht 

- Ist eine Philosophie wie Daten interpretiert werden 
- Jedes Element im Datenset wird als Event betrachtet 
- Bedingt Parsen der Daten vor Ansicht 


Tools: 

- Magnet (starker Vertreter von Philosophie)
- Nuix (soll in diese Richtung gehen)
- Cellebrite Inspector 
- (Autopsy) - Hybrid 


## FAT 

### Partition Boot Sector (PBS) 

- Boot Code 
- Parameter Block: 
    - Infos über Partition 
    - Verwendete Version
    - Dimension des Drives


### File Allocation Table (FAT)


- Adress-Verzeichnis für Data-Space - Riesige Tabelle für Adressierung
- Typischerweise 2 FAT für Redundanz
- Grösse abhängig von Typ & Datenträgergösse
    - FAT 12 -> 12 Bit Adresse
    - FAT 16 -> 16 Bit Adresse
- Usually little-endian


### Root Verzeichniss 

- Enthält die «Root-Directory-Table»
    • Welche Dateien liegen im Root-Directory
• Informationen über Dateien und Ordner auf dem Datenträger


### Data Sector

- Alle übrigen Daten 
- Aufgeteilt in Cluster
    - Grösse einstellbar aber immer gleichgross 2-32 KiB
    - Jeder Cluster kann nur 1 Datei enthalten
    - Datei muss nicht zwangsläufig kontinuierlich geschrieben werden


### Dateien 

- Eintrag in FAT (Pointer auf effektive Datei)
    - Sektor 1: 2 (Weil Sektor 1 nicht ausreicht für ganze Datei)
    - Sektor 2: EOF
- Datei in Data Sector



**Bei Löschung:** 

- Erstes Byte von Dateinamen wird durch '\_'  ersetzt
- Wenn nach gelöschten Dateien suchen
    - 21KB grosse Datei \_ateiA.jpg

### Dateiformat 

- Definierte, wie Daten innerhalb einer Datei gespeichert werden.
- Header (Quasi systematisch)
- Interne Metadaten (Manchmal obligatorisch)
- Daten (Immer)
- Footer (Bei manchen Datei-Formaten)


#### Magic number 

- Meiste Dateien beginnen mit "Magic Number" -> definiert dateityp
- [File Signatures](https://wikipedia.org/wiki/List_of_file_signatures)


#### File Header-Carving 

- Für jeden Cluster:
    - Entsprechen die erste Paar Bytes der "Magic Number" einer Datei?
    - Falls ja, dort beginnt eine Datei
- Wie lange ist die Datei?
    - Manche Datei-Typen haben eine Interne Länge
    - Manche Datei-Typen haben eine EOF-Markierung
- Kann u.U. sehr alte Dateien wiederfinden
- Viele false-positives (zwischen Cluster enthält Magic-Number)


### Probleme 

- Timestamps können gelöscht werden 
- Bei alten Einträgen ist u.U. der Verzeichnis-Eintrag nicht mehr vorhanden.
- Wann wurde diese Datei erstellt

**Ansätze:** 

- Erstellen einer Chronologie von Ereignissen
- Reihenfolge
    - Hat Ereignis A vor Ereignis B stattgefunden?
    - In welcher Reihenfolge werden Daten geschrieben?
- Datierung
    - Zu welchem Zeitpunkt hat Ereignis A stattgefunden?
    - Hat das Ereignis einen Timestamp, achtung: falsch geregelte Uhren
    - Kann ich das Ereignis mit einem datierten Ereignis in Verbindung bringen?


### Allgemeiner Stuff

- Slack: unbeschriebener space in Cluster, welcher Daten von vorheriger Datei enthält  
- Interspace: Space zwischen Partitionen
- Je weiter vorne auf der Disk, desto älter die Datei (Digital Stratigraphy)



## Residual Magnetism (HDD) 

Es ist möglich zu unterscheiden ob eine 0 zuvor eine 1 oder 0 überschrieben hat.



## Computer Forensics Windows 

- NTFS
- LNK
- Registries
- Prefetch
- Logs
- Tasks
- Papierkorb


### NTFS 

- Partition Boot Sector (Start der Partition, wo ist Master file table)
- MFT
    - Enthält Metadaten für Dateien 
    - Kleine Dateien werden direkt in MFT gespeichert
    - Die ersten 27 Einträge enthalten die Meta-Files, inkl MFT
    - Beim Formatieren wird automatisch Bereich für MFT reserviert (nicht am Anfang)
- Struktur von MFT
    - Total 1024 Bytes
    - Header - 56 Bytes
        - Signatur: `FILE` (4 Bytes)
        - Identifiers
        - Internal Offsets
        - Grösse
    - Data-Attribute (variabel)
    - End Marker `FF FF FF FF`
    - Filler
- Effizient für viele kleine Dateien
- **Metafiles** 
    - Für Funktionsweise von Dateisystem
    - Mehr oder weniger strukturiert wie normale Dteien 
    - Beispiele:
        - MFT
        - MFTMirr - Kopie von MFT
        - LogFile - Log von änderungen in FS-Metadaten
        - Volume - Metadaten
        - Root Directory
        - Bitmap - Bit array, welches freie & besetzte Cluster indiziert
        - Boot
        - BadClus - Liste aller beschädigten Cluster
        - Secure - Access Control List-Datenbank
        - UpCase - Unicode Uppercase-Charaktere
        - Extend - Ordner für erweiterte Metafiles
- **DATA** 
    - In Cluster aufgeteil
    - NTFS ist optimiert für 4KB Cluster
- Timestamp: 100ns seit 1601 00:00:00
- Die ersten Timestamps sind auf WIN11 in 2001


### Registry

- Hirarchische Datenbanken mit Systemeinstellungen
- Registry aufgeteilt in binäre Dateien (Hives) - Key:Value
- `%SystemRoot%\System32\Config\ `
    - SAM
        - User Daten
        - Account-Name
        - User ID
        - Erstellungsdatum
        - Logins
    - SECURITY
    - SOFTWARE
        - Installierte Software 
        - App-Namen / Identifier / Paths
        - I/O - Geräte
        - WiFi-Informationen
        - Auto-Run, Start-Up Services
    - SYSTEM 
        - Gerätename
        - Geräte-ID
        - Log-Orte
        - Systemarchitektur
        - IP-Konfiguration
        - Mounted Devices



### Importatn Ressources

- SANS DFIR (Poster)
- Plaso: timeline explorer?
- Additional Timeline Explorer application?


### LNK 

- Link -> default Browser etc
- File Header
- Shell Item ID
- Location Infor
- Data Strings
- Extra Data Block


### Prefetch 

- Unterstützt Ausführung von Applikationen
- Prefetch werden erzeugt for jede .exe die asugeführt wird
- Enthält Informationen über App-Launch
- Teilt dem System mit, welche Dateien von dieser Applikation benötigt werden

**Forensischer Wert:** 

- Apps
    - Run Count
    - Last run time
    - Loaded files
- Am zuverlässigsten Funkionierende Spurenquelle diesbezüglich


### Windows Logs 

- `%System32%\winevt\Logs`
- Primäre Logs:
    - Application
    - System
    - Security
- EVTX-Format
- File Signatur: ElfFile (45 6C66 46 69 6C 65)
- Binäre XML-Dateien


### Scheduled Tasks

- Like cronjobs?
- Job-Artefakt: `C:\Windows\Tasks` 
- Im Software-Hive ...
- EVTX-Log: ...


### Datei Löschen 

- Wird nur in Papierkorb verschoben: `C:\$Recycle.Bin\`




