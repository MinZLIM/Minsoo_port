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
    * [etc project](#etc project)
4. [terraform](#terraform)
    * [vSphere](#vsphere)

---

## 개요
 본 장에서는 자동화 및 테스트 편의 도구 개발 등 Ahnlab 에서 QA 업무 중 진행한 자동화 프로젝트들과 그 외 개인 프로젝트에 대하여 기술.  
<br />

---

##2 Bash Script
TrusGuard 는 Linux Kernel 기반 제품으로 기능 검증 간 자동화 tool 작성과 aging 테스트에 활용한 scipt 등을 기술.  
 
### Packet Header Control Tool
TrusGuard 의 Protocol Anomaly 기능 검증에 사용하기 위한 tool 을 Bash 로 작성하며 hping3 으로 Packet 변조를 수행.

### TCP Session Status Check Tool
TCP 의 세션 Status 별 상태 확인을 위하여 hping3 에서 flag 조정하는 tool 을 Bash 로 작성. 

### fqdn ip collect automation
fqdn 객체는 Dynamic 객체로 ip 주소가 지속적으로 바뀌는 특이성으로 인해 일정 수집한 ip 값을 바로 iptable 정책으로 넣지 않고 hash 테이블로 변환하여 사용되는 객체이다. <br />
고객사에서 발생한 특정 상황으로 동시에 수집된 같은 dns 주소를 가진 ip 객체에 대한 정보 테이블을 만들지 못하는 이슈가 발생. <br / >
타이밍 적인 상황과 , aging 이 필요한 이슈로 client - TrusGuard - server 구성에서 재현을 위한 Automation script 를 Bash 로 작성. <br /> 
