# CyberWars Mallorca

- SSH running on 2222 and 22
- Website: root user doesn't exist
- Feroxbuster only found the offical sites (login/dashboard)
- DNS enumeration with ffuf
    - `ffuf -u http://FUZZ.10.0.2.5 -w  /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -H "Host: FUZZ.10.0.2.5"` 
    - found nothing
- Webserver running almost newest version of Apache 
- All sites have no sources (no css/js files whatsoever)
- When booking an event POST paramater `event_id` manipulation:
    - non-existing or invalid IDs (-1, asdf, 99) just return event not found :(
- Replace post paramater `username` with admin in the password-reset request in burpsuite
- Login as admin with new password
- After that you can create events
- Event image can be whatever you want, as long as extension is img-extension
- files get saved as /img/<uuid>\_myimage.jpeg
- pages are with php but somehow revshell is not executed, not even when appended to image (it doesn't get stripped away)
- bruuuh, I'm so retarded
- on profile page there is an admin-page linked
- First flag: flag{aDm1n_g0T_h@ck3d}
- Even after docker-compose restart, password on ssh container isn't the same as the one on web-platform
- Intercept the request for docker-compose up
- Set docker-compose up args to `-d --build` 
- Password will be printed onto the screen from the build process: dev:SuperSecurePasswordNobodyWillGuess
- I changed password to "labadmin"
- no file found with name root.txt, user.txt, foothold.txt or flag.txt
- docker socket is mounted but docker not installed
- we have internet access and sudo rights
- install docker 
- docker breakout, same as in our CTF
- cat /root/flag.txt : flag{Mall0rcaMadn3ssMast3r_y0u_W0n_a_fR33_Ma110Rca_tR1P}






