---
layout: post
title:  "Automation"
date:   2020-02-04 10:00:40
blurb: ""
og_image: /assets/img/work/utm.png
---

# Table of Contents
1. [개요](#개요)
2. [Bash Script](#bash-script)
    * [Packet Header Control Tool](#packet-header-control-tool)
    * [TCP Session Status Check Tool](#tcp-session-status-check-tool)
3. [Python3 Script](#python3-script)
    * [TPAT](#tpat)
    * [Coin Bot](#coin-bot)
4. [Terraform](#terraform)
    * [vSphere](#vsphere)
5. [ETC Project](#etc-project)


---

# 개요
 본 장에서는 자동화 및 테스트 편의 도구 개발 등 Ahnlab 에서 QA 업무 중 진행한 자동화 프로젝트들과 그 외 개인 프로젝트에 대하여 기술.  
<br />

---

# Bash Script
TrusGuard 는 Linux Kernel 기반 제품으로 기능 검증 간 Bash Script 를 활용하여 테스트 tool 생성 및 aging 테스트를 수행하여 업무 효율성을 증대 시켰다.  
 
## Packet Header Control Tool
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


## TCP Session Status Check Tool
[tcp_session.sh](https://github.com/MinZLIM/Minsoo_port/blob/master/script/tcp_session.sh) <br />
TrusGuard 는 트래픽 로그 중 TCP 세션 로그를 표시하기 위한 컬럼으로 TCP Status 와 생성,종료 flag 를 표시해줌 <br />
TCP 의 세션 Status 별 상태 확인을 위하여 hping3 에서 flag 조정하는 tool 을 Bash 로 작성. 

---

# Python3 Script 
개인 학업 및 업무 수행간 주로 Python3 를 사용하여 진행하였으며, 이 장에서는 Python3 를 사용한 프로젝트 및 도구들을 기술. 

## TPAT
[TPAT](https://minzlim.github.io/Minsoo_port/2020/06/01/TPAT) <br />
 TrusGuard Platform Automation Test 의 약자로 다양한 HW 스펙을 가진 펌웨어 제품인 TrusGuard 플랫폼의 안정성 및 호환성을 주로 확인하기 위해 Python3,Docker,GoCD 를 활용하여 자동화 하였다. 

## Coin Bot
[Coin Bot](https://github.com/MinZLIM/minsoo_coinbot) <br />
 TrusGuard 에서 Restapi 를 지원을 하게되어 해당 내용 리서치 중 당시 코인 거래로 사용하던 업비트에서도 RestAPI 를 지원한다는 것을 알게되어, RestAPI 와 Python3 스터디 및 개인적인 목적을 가지고 위 프로젝트를 수행하게 되었다. <br />
 업비트에서 RestAPI 로 전달 받은 캔들(차트)정보를 토대로 MACD,RSI,Stocastic,etc 와 같은 지표들을 계산하고, 특정 시그널에 매도/매수 하는 전략으로 작성하였다.


---

# Terraform 
(진행 중 프로젝트) <br />
[ZTNA_Emulator](https://minzlim.github.io/Minsoo_port/2024/08/20/ZTNA_Emulator)
<br />
xTG(ZTNA)는 접근 디바이스의 OS 별로 ZTNA Agent 가 설치되어 인증 과정을 거치게 되며, 암호화 통신을 통해 내/외부 모든 접근을 하나도(Zero) 믿지 않는다는 개념이다. <br />
QA 팀에서는 Agent 가 설치된 Client 의 통신간 xTG 장비의 안정성 및 부하 테스트를 위해 자동화 환경을 구축하고 있다. <br />
본인은 윈도우 Agent 환경을 담당하여 Agent 의 동작(eg. 로그인/로그아웃) 및 xTG 트래픽 부하를 테스트 하기위해 Terraform 으로 vSphere 환경을 제어하고 있다. <br />

---

# ETC Project
 그 외 학업 및 개인 스터디 용 sub 프로젝트들을 기재.  <br />

 
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>표 만들기</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        border: 2px solid black; /* 표 전체의 테두리 */
    }
    th, td {
        border: 2px solid black; /* 각 셀의 테두리 */
        padding: 8px;
        text-align: left; /* 셀의 텍스트 우측 정렬 */
        word-wrap: break-word; /* 단어가 셀을 벗어나면 자동 개행 */
        white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 공백 없이 표시 */
    }
</style>
</head>
<table>
  <tr>
    <th>기간</th>
    <th>Project</th>
    <th>회사명</th>
    <th>담당업무</th>
    <th>Keyword</th>
  </tr>
  <tr>
    <td>2023.08 ~ 2023.12 (4 개월)</td>
    <td><a href="https://github.com/MinZLIM/minsoo_coinbot">Minsoo_Coinbot</a></td>
    <td>개인</td>
    <td>Coin 자동 거래 봇 프로그래밍</td>  
    <td>Python3, Rest API</td>
  </tr>
  <tr>
    <td>2018.08 ~ 2018.09 (1 개월) </td>
    <td><a href="https://1drv.ms/b/s!Aj3nsRarR3twnCi8Z0bIwBMkItQ-?e=HZZlin">네트워크 보안 강화 프로젝트</a></td>
    <td>KH 정보교육원</td>
    <td>해군 네트워크 구성 및 방화벽 정책 수립</td>
    <td>Network,Security,</td>
  </tr>
  <tr>
    <td>2019.01 ~ 2019.02 (2 개월)</td>
    <td><a href="https://onedrive.live.com/view.aspx?resid=707B47AB16B1E73D%216578&authkey=!AEd0Hhp-JBWUM8s">모의 해킹 프로젝트</a></td>
    <td>KH 정보교육원</td>
    <td>모의 해킹(Reverse Shell,로컬 부하,레지스트리 변조) </td>  
    <td>Python3, Security</td>
  </tr>
  <tr>
    <td>2017.09 ~ 2018.03 (6 개월)</td>
    <td><a href="https://1drv.ms/p/s!Aj3nsRarR3twh26VWGmkwj183af6?e=JiV6sC">Automatic pill dispenser</a></td>
    <td>조선대학교</td>
    <td>C 코딩, 아두이노 회로 설계, 아두이노 제어 앱 개발 </td>  
    <td>아두이노, APP Inventor </td>
  </tr>
  <tr>
    <td>2023.08 ~ 2023.12 (4 개월)</td>
    <td><a href="https://1drv.ms/p/s!Aj3nsRarR3tw011hJZ8Id88aUCv4?e=aV7wND">RFID를 이용한 그래픽 표현 도서 검색 시스템</a></td>
    <td>전자파학술대회</td>
    <td>RFID 제어 코드, 라즈베리파이 회로 설계 </td>  
    <td>RFID , 라즈베리파이</td>
  </tr>

</table>
</html>


------
