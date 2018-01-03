#!/bin/bash
Services(){
	clear
	echo '==--Services--=='
	echo '1. Start services'
	echo '2. Restart services'
	echo '3. Stop services'
	echo '4. Service status'
	echo '5. Main menu'
	echo '6. Quit'
	read servicemenuchoice
	
	case $servicemenuchoice in
	1)
		StartServices
	;;
	2)
		RestartServices
	;;
	3)
		StopServices
	;;
	4)
		ServiceStatus
	;;
	5)
		Mainmenu
	;;
	6)
		Quit
	;;
	*)
		echo "Input a number 1-6 please"
		sleep 2
		Services
	;;
	esac
}

StartServices(){
	clear
	echo "==--Start Services--=="
	echo "1. postgresql"
	echo "2. SSH"
	echo "3. Apache2/html"
	echo "4. Services menu"
	echo "5. Main menu"
	echo "6. Quit"
	read startserviceschoice

	case $startserviceschoice in
	1)
		echo "Starting service . . ."
		sleep 1
		service postgresql start
		service postgresql status | head -3 | tail -1
		sleep 3
		StartServices
	;;
	2)
		echo "Starting service . . ."
		sleep 1
		systemctl start ssh
		systemctl status ssh | head -3 | tail -1
		sleep 3
		StartServices
	;;
	3)
		echo "Starting service . . ."
		sleep 1
		systemctl start apache2
		systemctl status apache2 | head -3 | tail -1
		sleep 3
		StartServices
	;;
	4)
		Services
	;;
	5)
		Mainmenu
	;;
	6)
		Quit
	;;
	*)
		echo "Input between 1-6 please"
		StartServices
	esac
}

RestartServices(){
	clear
	echo "==--Restart Services--=="
	echo "1. postgresql"
	echo "2. SSH"
	echo "3. Apache2/html"
	echo "4. Services menu"
	echo "5. Main menu"
	echo "6. Quit"
	read restartserviceschoice

	case $restartserviceschoice in
	1)
		echo "Restarting service . . ."
		sleep 1
		service postgresql restart
		service postgresql status | head -3 | tail -1
		sleep 3
		RestartServices
	;;
	2)
		echo "Restarting service . . ."
		sleep 1
		systemctl restart ssh
		systemctl status ssh | head -3 | tail -1
		sleep 3
		RestartServices
	;;
	3)
		echo "Restarting service . . ."
		sleep 1
		systemctl restart apache2
		systemctl status apache2 | head -3 | tail -1
		sleep 3
		RestartServices
	;;
	4)
		Services
	;;
	5)
		Mainmenu
	;;
	6)
		Quit
	;;
	*)
		echo "Input between 1-6 please"
		RestartServices
	esac
}

StopServices(){
	clear
	echo "==--Stop Services--=="
	echo "1. postgresql"
	echo "2. SSH"
	echo "3. Apache2/html"
	echo "4. Services menu"
	echo "5. Main menu"
	echo "6. Quit"
	read stopserviceschoice

	case $stopserviceschoice in
	1)
		echo "Stopping service . . ."
		sleep 1
		service postgresql stop
		service postgresql status | head -3 | tail -1
		sleep 3
		StopServices
	;;
	2)
		echo "Stopping service . . ."
		sleep 1
		systemctl stop ssh
		systemctl status ssh | head -3 | tail -1
		sleep 3
		StopServices
	;;
	3)
		echo "Stopping service . . ."
		sleep 1
		systemctl stop apache2
		systemctl status apache2 | head -3 | tail -1
		sleep 3
		StopServices
	;;
	4)
		Services
	;;
	5)
		Mainmenu
	;;
	6)
		Quit
	;;
	*)
		echo "Input between 1-6 please"
		StopServices
	esac
}

ServiceStatus(){
	clear
	echo '========='
	service postgresql status | head -3
	echo '========='
	systemctl status ssh | head -3
	echo '========='
	systemctl status apache2 | head -3
	sleep 6
	Services
}

ZoneTransfer(){
	clear
	echo 'This will identify the DNS servers for a domain and attempt a zone transfer, outputting to a text file'
	echo 'Please input domain:'
	read domain
	echo 'Please input filename:'
	read filename
	for server in $(host -t ns $domain | cut -d " " -f 4)
		do
		host -l $domain $server | grep "has address" >> $filename
		clear
		echo "Outputting to $filename"
		cat $filename
		sleep 3
		done
	Mainmenu
}

Nmap(){
	echo 'Nmap'
}

Quit(){
	exit
}

Mainmenu(){
	clear
	echo "==--Welcome to John's Toolz--=="
	echo "1. Services"
	echo "2. Zone Transfer"
	echo "3. Nmap"
	echo "4. Quit"
	read mainmenuchoice

	case $mainmenuchoice in
	1)
		Services
	;;
	2)
		ZoneTransfer
	;;
	3)
		Nmap
	;;
	4)
		Quit
	;;
	*)
		echo "Input a number 1-4 please"
		sleep 3
		Menu
	;;
	esac
}

Mainmenu
