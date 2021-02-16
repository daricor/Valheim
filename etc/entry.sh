#!/bin/bash


deregister_runner() {
    echo "Valheim server is beeing stopped"
    ./vhserver stop
    echo "Valheim server is shutdown"
    exit
}

trap deregister_runner SIGINT SIGQUIT SIGTERM

# If server is missing, then it's a fresh start 
if [ ! -e "/home/linuxgsm/serverfiles" ]; then
	
	bash linuxgsm.sh vhserver	
	echo "Server is installing"
	./vhserver install

fi


echo -e "servername=\"${SERVERNAME}\"\nserverpassword=\"${SERVERPASSWORD}\"\nport=\"${SERVERPORT}\"\ngameworld=\"${GAMEWORLD}\"\npublic=\"${PUBLIC}\"" > /home/linuxgsm/lgsm/config-lgsm/vhserver/common.cfg
echo "startparameters=\"-name '\${servername}' -password \${serverpassword} -port \${port} -world \${gameworld} -public \${public}\"" >> /home/linuxgsm/lgsm/config-lgsm/vhserver/common.cfg

echo "Server is starting"

./vhserver start
