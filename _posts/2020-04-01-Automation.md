---
layout: post
title:  "TrusGuard QA Engineering"
date:   2020-02-04 10:00:40
blurb: ""
og_image: /assets/img/work/utm.png
---

## Table of Contents
1. [개요](#개요)
2. [Bash Script](#bash-Script)
    * [Packet Header Control Tool](packet-header-control)
    * [TCP Session Status Check Tool](#tcp-session-status-check-tool)
    * [fqdn ip collect automation](#fqdn-ip-collect-automation) 
3. [Python3 Script](#python3-script)
    * [TPAT](#tpat)
    * [Coin Bot](#coin-bot)
    * [etc project](#etc-project)
4. [terraform](#terraform)
    * [vSphere](#vsphere)

---

## 개요
 본 장에서는 자동화 및 테스트 편의 도구 개발 등 Ahnlab 에서 QA 업무 중 진행한 자동화 프로젝트들과 그 외 개인 프로젝트에 대하여 기술.  
<br />

---

## Bash Script
TrusGuard 는 Linux Kernel 기반 제품으로 기능 검증 간 Bash Script 를 활용하여 테스트 tool 생성 및 aging 테스트를 수행하여 업무 효율성을 증대 시켰다.  
 
### Packet Header Control Tool
[anomaly_protocol.sh](https://github.com/MinZLIM/Minsoo_port/blob/master/script/anomaly_protocol.sh)
TrusGuard 의 Protocol Anomaly 기능 검증간 업무 효율화를 위해 hping3 으로 Packet 변조를 수행하는 tool 을 Bash 로 작성.
 - IPv4/IPv6  
   > IP 스푸핑 / Land Attack / ETC
 - UDP
   > 헤더 정보 불일치 
 - TCP
   > 비정상 플래그 , 헤더 정보 불일치 
 - ICMP
   > Ping of Death 


### TCP Session Status Check Tool
[tcp_session.sh](https://github.com/MinZLIM/Minsoo_port/blob/master/script/tcp_session.sh)
TrusGuard 는 트래픽 로그 중 TCP 세션 로그를 표시하기 위한 컬럼으로 TCP Status 와 생성,종료 flag 를 표시해줌
TCP 의 세션 Status 별 상태 확인을 위하여 hping3 에서 flag 조정하는 tool 을 Bash 로 작성. 

