# RAM Analyse

## Was ist die build-number des installierten OS?

```bash
vol -f memdump-001.mem windows.info 

[...]
PE MajorOperatingSystemVersion	6
PE MinorOperatingSystemVersion	1
[...]
```

Version: 6.1.

## Was ist der Account-Name des Nutzers dieses Geräts?

```py
vol -f memdump-001.mem windows.registry.hivekey

Offset          FileFullPath                                                        File output
[...]
0xf8a003ebd010  \??\C:\Users\Warren\ntuser.dat                                      Disabled
0xf8a003ec6010  \??\C:\Users\Warren\AppData\Local\Microsoft\Windows\UsrClass.dat    Disabled
[...]
```

User: Warren

## Netzwerkverbindung 

> Zum Zeitpunkt der Sicherung (20-Apr-20 23:23:26- Imageinfo) war eine Netzwerk-Verbindung zu einem Google-Server etabliert.


1. **Was war die IP-Adresse und Port dieser Verbindung?**

`windows.netstat`: 

```
Offset          Proto   LocalAddr       LocalPort   ForeignAddr	    ForeignPort	State           PID     Owner   Created

0x13ec87cd0     TCPv4   192.168.10.146  54282       172.253.63.188  443         ESTABLISHED     -       -       N/A
0x13ece76f0     TCPv4   192.168.10.146  54277       172.253.63.188  5228        FIN_WAIT2       -       -       N/A
0x13ece73b0     TCPv4   192.168.10.146  54281       13.35.82.31     443         ESTABLISHED     -       -       N/A
0x13ecf8010     TCPv4   192.168.10.146  54280       13.35.82.102    443         ESTABLISHED     -       -       N/A
0x13f2e5010     TCPv4   192.168.10.146  54284       13.107.21.200   443         CLOSED          -       N/A
0x13f304280     TCPv4   192.168.10.146  54283       13.107.21.200   443         CLOSED          -       N/A
```

- `nslookup google.com`: 172.217.168.78
- FIN_WAIT2 -> quasi closed 
- kein whois Eintrag
- keine HTTP-Kommunikation
- alle sind ping-able


Antwort: unklar


2. **(Bonus) Wie lange hatte der Nutzer auf dieses Chrome-Browserfenster betrachtet?**



## Eigene Unterhaltung 

Der Nutzer hatte eine Unterhaltung mit sich selber betreffend eines neuen Passworts. Was für ein Passwort zog die Person in Erwägung?
(Tip: Verwenden Sie ”strings”)


## (Bonus) Wo könnten Sie lernen ”how hackers hack, and how to stop them”?


## Note

Bei diesem Datenset scheint ein Problem mit dem Volatility-Plugin ”strings”
zu exisitieren, das dazu führt, dass das Plugin nicht abschliesst. Insb. bei
Aufgabe 5 wäre dieses Plugin nützlich, die Aufgabe ist jedoch auch +/- ohne
lösbar.
Diese Übungsserie ist eine Spur anspruchsvoller als bisherige Serien. Ich
habe ein Lösungsdokument, falls Sie es nicht schaffen, die Übungen zu lösen.

