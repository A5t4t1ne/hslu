# CTF 2

IP: 192.168.204.241 
site: /dragon 




## Steps 

- Nmap scan 
- Website enumeration
- Some manual sniffing on website 
- Searching 'a' in search field 
- sqlmap with search `sqlmap http://192.168.204.241/dragon/?s=keyword -p s`
- revshell with file upload
- linpeas
- something interesting in user or home folder 
- can't access mysql database in /var/lib
- User delphine password in wp-config.php
- sudo -l
- create python script with /bin/bash -p and execute with sudo 
- as sudo: mysql -> use wordpress_db; select * from wp_users -> get hash from tullius
- curl to IP found in cronjob with different payloads
- curl post with body argument: "Message sent"
- curl post with another argument: Exception
- get request to API returns nothing
- Admin page accessible
- movement to /etc/passwd 
- curl /admin/browse.jsp?... > all messages (link to consumers)
- no consumers ...
- rev proxy 
- ActiveMQ 5.11 revshell vulnerable (msf)
- Juicy file in Home folder veezara (Pictures/notlikethis.jpg)


### Ports 


```
sudo nmap -A 192.168.204.241                                                                                                                                                                                                       
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-17 17:06 CEST
Nmap scan report for Whiterun.robstargames.com (192.168.204.241)
Host is up (0.00046s latency).
Not shown: 997 filtered tcp ports (no-response)
PORT    STATE  SERVICE VERSION
22/tcp  open   ssh     OpenSSH 9.2p1 Debian 2+deb12u3 (protocol 2.0)
| ssh-hostkey: 
|   256 1a:fe:b4:53:a9:99:27:17:68:ff:8c:d0:e8:be:e9:88 (ECDSA)
|_  256 48:99:67:cb:ed:60:e8:69:9b:f2:2c:5b:b5:12:00:c1 (ED25519)
80/tcp  open   http    Apache httpd 2.4.62
|_http-title: 404 Not Found
|_http-server-header: Apache/2.4.62 (Debian)
443/tcp closed https
Aggressive OS guesses: Linux 4.15 - 5.8 (98%), Linux 5.0 - 5.5 (97%), Linux 5.0 - 5.4 (94%), Linux 2.6.32 (94%), Linux 3.2 - 4.9 (94%), Linux 2.6.32 - 3.10 (93%), Linux 5.4 (93%), Linux 5.3 - 5.4 (92%), Linux 3.4 - 3.10 (92%), Synology DiskStation Manager 5.2-5644 (91%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 2 hops
Service Info: Host: 127.0.1.1; OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 443/tcp)
HOP RTT     ADDRESS
1   0.27 ms 192.168.156.1
2   0.52 ms Whiterun.robstargames.com (192.168.204.241)

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 19.63 seconds
```


### Website 

- Wordpress site
- It's a blog site 
- XSS not working on comments
- Newest Wordpress version 6.6.2
- Hello World post posted by tullius
- asdf



### Search 

Search with 'a' returned another post besides "Hello World": sample post 



## Possible Hints

"To get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.
Commenter avatars come from Gravatar."

Conclusion: Get to dashboard? - /dragon/wp-admin restricted


## Rev proxy 


sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests


```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    # Proxy settings
    ProxyRequests Off
    ProxyPreserveHost On

    <Proxy *>
        Order allow,deny
        Allow from all
    </Proxy>

    # Reverse proxy to the target server
    ProxyPass / http://192.168.204.95:8161/
    ProxyPassReverse / http://192.168.204.95:8161/

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

## Trying to get the picture 

- no http server
- no networking tools
- couldn't start ftp server 
- to big for base64

Solution: copy to location accessible by the website \\ 

Password of ulfric


## Escalation to root

- WinPEASx64: no direct hit, but veezara has admin rights
- Administrator Key in SSH folder doesn't correspond to the ones located there 
- No SSH logs
- **put public ssh key into veezaras folder**
- `move C:\\Windows\\root.txt to C:\Program Files (x86)\apache-activemq-5.11.1\webapps\root.txt`
- `rename root.txt root.png`
- *open in firefox*
- after trying out because of curiosity: you can also copy the root flag with the revshell





