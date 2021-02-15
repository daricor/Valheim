#!/bin/bash


deregister_runner() {
    echo "Valheim server is beeing stopped"

    echo "Valheim server is shutdown"
    exit
}

trap deregister_runner SIGINT SIGQUIT SIGTERM

# If server is missing, then it's a fresh start 
if [ ! -e "/home/linuxgsm/serverfiles" ]; then
	
	bash linuxgsm.sh vhserver	
	echo "Server is installing"

fi

echo "Server is starting"
