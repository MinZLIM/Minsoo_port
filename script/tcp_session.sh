#!/bin/bash

clear
echo "Enter a role of this Device ( 1 : Clent / 2 : Server )"
read Role
echo "Enter the IP of Client"
read clientIP
echo "Enter the IP of Server"
read serverIP
echo "enter the port number of Client"
read clientPort
echo "enter the port number of Server"
read serverPort


while true
do
clear
echo "CLIENT                                   SERVER"
echo "$clientIP:$clientPort                     $serverIP:$serverPort"
echo "==============================================="
echo "1 : | ----------------SYN------------------> |"
echo "2 : | <-------------SYN ACK----------------- |"
echo "3 : | ----------------ACK------------------> |"
echo "    [ <========Established Session=========> ]"
echo "8 : | <---------------RST------------------> |"
echo "4 : | --------------FIN ACK----------------> |"
echo "5 : | <-------------FIN ACK----------------- |"
echo "6 : | ----------------ACK------------------> |"
echo "7 : EXIT"

echo "Enter the number of sequence"
read Sequence


case $Sequence in
 1)

  if test $Role -eq 1
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1

          hping3 -S $serverIP -a $clientIP -s $clientPort -p $serverPort -M 0 -L 0 -c 1
  elif test $Role -eq 2
  then
   clear
   echo "It is not available at Server"
   sleep 1
  fi

 ;;
 2)
  if test $Role -eq 1
  then
   clear
                        echo "It is not available at Client"
   sleep 1
  elif test $Role -eq 2
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1
    hping3 -S -A $clientIP -a $serverIP -s $serverPort -p $clientPort -M 0 -L 1 -c 1

  fi

 ;;
        3)
  if test $Role -eq 1
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1

                 hping3 -A $serverIP -a $clientIP -s $clientPort -p $serverPort -M 1 -L 1 -c 1

  elif test $Role -eq 2
  then
          clear
          echo "It is not available at Server"
   sleep 1
  fi

  ;;

8)
  if test $Role -eq 1
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1

                 hping3 -R $serverIP -a $clientIP -s $clientPort -p $serverPort -M 1 -L 1 -c 1

   elif test $Role -eq 2
  then
      clear
    echo "BBANG~!!"
          sleep 1
           hping3 -F -A $clientIP -a $serverIP -s $serverPort -p $clientPort -M 1 -L 1 -c 1
         fi


   sleep 1

        ;;
        4)
  if test $Role -eq 1
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1

                 hping3 -F -A $serverIP -a $clientIP -s $clientPort -p $serverPort -M 1 -L 1 -c 1

  elif test $Role -eq 2
  then
   clear
                        echo "It is not available at Server"
   sleep 1
  fi

        ;;
        5)
  if test $Role -eq 1
  then
                        clear
   echo "It is not available at Client"
   sleep 1
  elif test $Role -eq 2
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1

                 hping3 -F -A $clientIP -a $serverIP -s $serverPort -p $clientPort -M 1 -L 1 -c 1

  fi

        ;;
        6)
  if test $Role -eq 1
  then
                        clear
                        echo "BBANG~!!"
                        sleep 1

                 hping3 -A $serverIP -a $clientIP -s $clientPort -p $serverPort -M 1 -L 1 -c 1

  elif test $Role -eq 2
  then
   clear
                        echo "It is not available at Server"
   sleep 1
  fi

        ;;
        7)
  clear
  echo "Bye Bye~!"
  sleep 1
  exit
        ;;
esac



done
