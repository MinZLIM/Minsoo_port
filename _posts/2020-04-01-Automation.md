---
layout: post
title:  "Automation"
date:   2020-02-04 10:00:40
blurb: ""
og_image: /assets/img/work/utm.png
---

## Table of Contents
1. [개요](#개요)
2. [Bash Script](#bash-Script)
    * [Packet Header Control Tool](#packet-header-control-tool)
    * [TCP Session Status Check Tool](#tcp-session-status-check-tool)
3. [Python3 Script](#python3-script)
    * [TPAT](#tpat)
    * [Coin Bot](#coin-bot)
4. [Terraform](#terraform)
    * [vSphere](#vsphere)

5. [ETC Project](#etc-project)
---

## 개요
 본 장에서는 자동화 및 테스트 편의 도구 개발 등 Ahnlab 에서 QA 업무 중 진행한 자동화 프로젝트들과 그 외 개인 프로젝트에 대하여 기술.  
<br />

---

## Bash Script
TrusGuard 는 Linux Kernel 기반 제품으로 기능 검증 간 Bash Script 를 활용하여 테스트 tool 생성 및 aging 테스트를 수행하여 업무 효율성을 증대 시켰다.  
 
### Packet Header Control Tool
[anomaly_protocol.sh](https://github.com/MinZLIM/Minsoo_port/blob/master/script/anomaly_protocol.sh) <br />
TrusGuard 의 Protocol Anomaly 기능 검증간 업무 효율화를 위해 hping3 으로 Packet 변조를 수행하는 tool 을 Bash 로 작성. <br />
 - IPv4/IPv6  
   > IP 스푸핑 / Land Attack / ETC
 - UDP
   > 헤더 정보 불일치 
 - TCP
   > 비정상 플래그 , 헤더 정보 불일치 
 - ICMP
   > Ping of Death 


### TCP Session Status Check Tool
[tcp_session.sh](https://github.com/MinZLIM/Minsoo_port/blob/master/script/tcp_session.sh) <br />
TrusGuard 는 트래픽 로그 중 TCP 세션 로그를 표시하기 위한 컬럼으로 TCP Status 와 생성,종료 flag 를 표시해줌 <br />
TCP 의 세션 Status 별 상태 확인을 위하여 hping3 에서 flag 조정하는 tool 을 Bash 로 작성. 

---

## Python3 Script 
개인 학업 및 업무 수행간 주로 Python3 를 사용하여 진행하였으며, 이 장에서는 Python3 를 사용한 프로젝트 및 도구들을 기술. 

### TPAT
[TPAT](https://github.com/MinZLIM/Minsoo_port/blob/master/_posts/2022-06-01-TrusGuard_Platform_Automation_Test.md) <br />
 TrusGuard Platform Automation Test 의 약자로 다양한 HW 스펙을 가진 펌웨어 제품인 TrusGuard 플랫폼의 안정성 및 호환성을 주로 확인하기 위해 Python3,Docker,GoCD 를 활용하여 자동화 하였다. 

### Coin Bot
[Coin Bot](https://github.com/MinZLIM/minsoo_coinbot) <br />
 TrusGuard 에서 Restapi 를 지원을 하게되어 해당 내용 리서치 중 당시 코인 거래로 사용하던 업비트에서도 RestAPI 를 지원한다는 것을 알게되어, RestAPI 와 Python3 스터디 및 개인적인 목적을 가지고 위 프로젝트를 수행하게 되었다. <br />
 업비트에서 RestAPI 로 전달 받은 캔들(차트)정보를 토대로 MACD,RSI,Stocastic,etc 와 같은 지표들을 계산하고, 특정 시그널에 매도/매수 하는 전략으로 작성하였다.


---

## Terraform(진행 중 프로젝트) 
xTG(ZTNA)에서는 접근 디바이스의 OS 별로 ZTNA Agent 가 설치되며 인증 과정을 거치게 된다. <br />
위 Agent 의 동작 및 xTG 트래픽 부하를 테스트 하기위해 Terraform 으로 vSphere 환경을 제어하고 있다. <br />

---

## etc project
 그 외 학업 및 개인 스터디 용 sub 프로젝트들을 기재.  <br />
 [KH Final Project](https://onedrive.live.com/edit?id=707B47AB16B1E73D!6578&resid=707B47AB16B1E73D!6578&ithint=file%2cpptx&authkey=!AEd0Hhp-JBWUM8s&wdo=2&cid=707b47ab16b1e73d) <br />
  > KH 정보교육원에서 교육 중 마지막 프로젝트로 본인은 공격자 역할로 Reverse Shell , 랜섬웨어 프로그램을 Python3 로 작성.  <br />

[RFID를 이용한 그래픽 표현 도서 검색 시스템](https://onedrive.live.com/edit?id=707B47AB16B1E73D!10717&resid=707B47AB16B1E73D!10717&ithint=file%2cpptx&authkey=!AGElnwh3zxpQK_g&wdo=2&cid=707b47ab16b1e73d) <br />
 > 학부생 시절 소속 연구실 포스터 논문으로 아두이노와 RFID 를 활용한 도서 위치 검색 시스템.  <br />
