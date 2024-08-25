---
layout: post
title:  "ZTNA Emulator(진행 중 프로젝트)"
date:   2024-08-25 10:00:40
blurb: ""
og_image: /assets/img/content/post-example/Banner.jpg
---

<br />


# Table of Contents
1. [개요](#개요)
    * [배경](#배경)
    * [목표](#목표)    
2. [구현 과제](#구현-과제)
    * [Network 환경 별 VM 프로비저닝](#network-환경-별-VM-프로비저닝)
    * [Window VM Host 별 GUI 세션 제어](#window-vm-host-별-gui-세션-제어)

# 개요
## 배경
 TrusGuard에서는 ZTNA 개념 도입을 위해 xTG프로젝트를 진행하게 되었으며, ZTNA Agent 로 Window , Linux , MAC , Android 등 다양한 OS 를 지원한다. 이중 가장 많은 Client OS 로 예상되는 Window 환경에서 xTG의 ZTNA Manager/Gateway/Agent 통신의 기능 안정성 및 Network 환경 구성에 의한 동작 안정성 등을 테스트할 필요가 생겼다.
<br />
 기존에 Window Host 가 필요한 환경은 Real PC 나 임의로 생성한 VM 을 통하여 수동 테스트를 진행하며, 고정으로 구성된 Network topology 로 테스트 진행 하였다.
<br /> 
 이에 TrusGuard 의 Window Agnet 활용 환경과, xTG(ZTNA) 기능의 Test Coverage 와 신뢰성을 고도화 시키기 위해 본 프로젝트르 진행하게 되었다.  


## 목표
 xTG ZTNA 은 기본적으로 가장 많이 사용될 것으로 유추되는 4 가지 Network Topology(SSL VPN 을 통한 ZTNA, IPSec 을 통한 ZTNA, 내부 클라이언트의 외부망 접근에서의 ZTNA, SWG 환경에서의 ZTNA ) 를 고려하여 설계되었다. 
<br />
 Client 들의 Network 환경을 유동성있게 프로비저닝 하기 위해서 Terraform 을 활용한 VM 프로비저닝을 수행하며,  최대 120대의 VM Host로 ZTNA Agent를 통한 인증, ZTNA Manager에 의한 통신 제어 동작과 ZTNA Gateway에 대량의 트래픽이 흐르는 환경에서 데몬 상태 및 통신 상태의 신뢰성을 확보하고자 한다.

<br />

# 구현 과제
<img src="{{ "/assets/img/content/ZTNA/ZTNA_WIN_Emulator.png" | absolute_url }}" alt="bay" class="post-pic"/>

## Network 환결 별 VM 프로비저닝
 - vSphere 환경은 가상 스위치와 vlan을 통한 Netowrk Domain 설정을 수행할 수 있으며, Terraform 의 vSphere 모듈에서 이에 대한 설정을 지원하고 있다. 이에 따라 하기와 같이 vSphere VM 프로비저닝을 수행하며, 4 가지 Network Topology 환경을 구성한다.
<img src="{{ "/assets/img/content/ZTNA/ZTNA_Network.png" | absolute_url }}" alt="bay" class="post-pic"/>

<br />

## Window VM Host 별 GUI 세션 제어
 - Terraform 에서 vSphere 모듈을 통하여 VM 프로비저닝에 대한 Config 를 지정한다. (VM Tpl, Network Config)
<img src="{{ "/assets/img/content/ZTNA/vSphereConfig.png" | absolute_url }}" alt="bay" class="post-pic"/>

 - Window Host 에 원격 자동화는 다양한 Tool을 지원하지만 GUI 세션 원격 제어, CICD 연동을 위해 GoCD Agent를 활용하여 구축한다. 
<img src="{{ "/assets/img/content/ZTNA/WIN_GoCD_Link.png" | absolute_url }}" alt="bay" class="post-pic"/>

<br />
