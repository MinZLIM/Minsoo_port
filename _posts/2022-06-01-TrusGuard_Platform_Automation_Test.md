---
layout: post
title:  "T-PAT(TrusGuard Platform Automation Test)"
date:   2020-06-01 10:00:40
blurb: "A look at an example post using Bay Jekyll theme."
og_image: /assets/img/content/post-example/Banner.jpg
---

<br />
<br />

<br />


## Table of Contents
1. [개요](#개요)
    * [목표](#목표)
    * [배경](#배경)
2. [구현과제](#구현과제)
    * [TG Platform 별 검증 효율화를 위한 환경 구축](#tg-platform-별-검증-효율화를-위한-환경-구축)
    * [TG Platform 기반의 자동화 검증 환경 구축](#tg-platform-기반의-자동화-검증-환경-구축)
3. [물리구성](#물리구성)
    * [물리 구성 규칙](#물리-구성-규칙)
    * [물리 구성 세부 내용](#물리-구성-세부-내용)
4. [자동화 구성](#자동화-구성)
    * [Spec](#spec)
    * [Framework](#framework)
    * [Test Case](#test-case)

---

## 개요
### 목표
Trusguard는 통합 NOS를 사용하고 있으며 CPU, Memory, Interface 등... Hardware적 구분은 NAPS와 Software적 정의를 통해 Platform 구분하고 Hardware Spec에 걸맞는 서비스를 제공하고 있다. 이에 따라 Fimeware가 신규로 제공되는 경우 전체 Platform은 영향을 받게되어 있다.
<br />
Firmware 변경이 발생되는 경우 Platform별 상이하게 발생될 수 있는 H/W기반 특성과 S/W특성을 사전에 검증하여 Firmware 변경 발생 시 안정적 품질의 서비스를 제공하는 것을 목표로 한다.
<br />
이를 이루기 위해선 플랫폼별 검증 효율화를 위한 환경 구축이 필요하며 이를 이용한 자동화 구축이 필요하다.
<br />
TrusGuard의 플랫폼 별(H/W 사양에 따른) 검증 효율화
<br />
1 ) 플랫폼별 검증 효율화를 위한 환경 구축
<br />
2 ) 자동화를 통한 플랫폼 별 검증 진행
<br />

### 배경
TrusGuard는 2022년 현재 25종 (Low-end 6종, middle-end 13종, high-end 6종)의 Line-up 구성이며, 유지보수에 해당되는 제품까지 포함하여 총 25종의 platform을 지원하고 있다.
<br />
또한, Middle-end 이상의 제품에서는 지원되는 NIC(Network Interface Card)는 총 18종에 이른다.
<br />
위와 같은 환경에서 H/W의 동작에 영향을 미치는 기능. 특히 NAPS와 같이 NIC 의 성능과 기능에 영향을 주는 사항에 대한 변경 시 각 Platform 및 지원되는 NIC 에 대한 검증이 필수적으로 수행되어야 한다.
<br />
현재의 문제점은 지원되는 Platform과 NIC의 종류가 점차 확대됨에 따라 Platform 별 전수 검증이 수행될 수 없으며, 그에 따른 리스크가 존재하고 있다.
<br />	
Software를 기반으로 하는 기능, 성능 검증의 테스트와 자동화 구축은 다양한 형태로 활발히 이루어 지고 있다. 
<br />
TG의 경우 다양한 Platform과 NIC을 제공하고 있으며 일부 기능들은 H/W에 매우 밀접하고 의존적으로 동작하고 있다. 
<br />
그러나 H/W를 기반으로 Software를 Test하는 환경과 시나리오는 부족한 실정이다. 주요 H/W변경, 전체 Platform에 영향을 주는 S/W수정, NAPS 버전 Upgrade 시 품질과 안정성 보증을 위해 때마다 수동 전수 검증 되고 있으며 이에 따른 비용이 발생한다.
<br />

---

## 구현과제
### TG Platform 별 검증 효율화를 위한 환경 구축
TrusGuard Line-up 중 25종 선별 및 모든 종류의 Ethernet Driver를 사용하는 환경을 구축한다.
<br />
Platform별 비교 시험과 검증이 가능한 자동화 구축 환경을 제공한다.
<br />

### TG Platform 기반의 자동화 검증 환경 구축
Control command: ssh접속 & cli 제어
<br />
Programming: Python3
<br />
Automation Framework : NQA팀 Gauge 및 GoCD이용
<br />
TG Software지원 범위 계획: 주요 유지보수 버전 (TG2.7.3, TG2.7.4, TG2.7.5)
<br />
Platform 검증 Test Category 구현 계획
<br />
    ① Platform별로 상이한 H/W기반 동작을 검증할 수 있는 Test scenario 선별
<br />
    ② Platform별로 상이한 Software Spec을 검증할 수 있는 Test scenario 선별
<br />
    ③ Platform별로 상이한 S/W기반 동작을 검증할 수 있는 Test scenario 선별
<br />
    ④ Platform별로 상이한 결과를 가져올 수 있는 Aging Test scenario 선별 
<br />

---

## 물리구성
### 물리 구성 규칙
TrusGuard Line-up 중 20종 선별 및 모든 종류의 Ethernet Driver를 사용하는 환경을 구축한다.
<br />
-규칙
<br />
- 우선순위 1. Sales model
<br />
- 우선순위 2. Best-selling model (ex: 학내망 TG300E, KB TG40A 등…)
<br />
- 우선순위 3. EOS(End of Sale) Maintenance model
<br />
- 우선순위 4. EOD(End of Development) model
<br />
- 우선순위 5. Base Hardware가 동일한 모델 (ex: TG300E와 TG100B는 H/W기반이 동일함.)
<br />
- NIC은 Ethernet Driver를 기준으로 모든 종류가 구축될 수 있도록 한다.
<br />
- H/W 변경(ex: Memory증설, CPU교체등…)이 발생되는 경우, “우선순위1” 조건에 따라 H/W변경이 반영된 최종 Sales Model으로 환경을 구성한다.
<br />
Trusguard ALL Line-up 대상으로 각 1대씩 구축 : 2022. 10.31   기준 25대
<br />
환경구축용 Switch 1Base-T (상단,하단) : 2대 
<br />
환경구축용 Switch 1G, 10G Fiber: 1대
<br />
Linux Server (Worker) : 2대

### 물리 구성 세부 내용
자동화 환경에서 Route mode, Bridge mode의 자유로운 설정이 가능한 기초 물리 구성을 한다.
<br />
<img src="{{ "/assets/img/content/TPAT/TPAT1.png" | absolute_url }}" alt="bay" class="post-pic"/>
<br />
전체적인 물리구성도는 아래와 같고 eth2, eth3을 통해 모든 Line-up은 Switch 상,하단으로 연결되어 있다. eth4, eth5는 각각의 TG끼리 상,하단으로 연결되어 있다.
<br />
상하단의 Switch는 Worker 혹은 계측기와 연결을 할 수 있도록 하여 전체 Line-up에 대한 Traffic Test가 될 수 있도록 구축을 하였다.
<br />
Test목적에 자동화를 구축하여 Switch나 TG를 control하여 Bridge mode, Route mode를 선택하여 Traffic이 인가될 수 있는 기초 환경을 구축, 검증이 이루어질 수 있도록 한다.
<br />
Switch나 TG를 control하여 Bridge mode, Route mode를 선택하여 Traffic이 인가될 수 있는 기초 환경의 예
<br />
<img src="{{ "/assets/img/content/TPAT/TPAT2.png" | absolute_url }}" alt="bay" class="post-pic"/>
<br />

---

## 자동화 구성
### Spec
Trusguard 전 Platform을 지원하며 지원 가능한 TG의 Frimware는 TG2.7.3 이상으로 정의한다. (주요 유지보수 버전)
<br />
자동화 Framework : NQA팀에 구축된  Gauge와 GoCD를 사용하여 구현 한다.
<br />
Gauge는 Python을 포함하여 다양한 언어를 지원하는 자동화 Framework이다. 
<br />
Gauge는 테스트 케이스를 정의하고 자동으로 수행 하는 방법을 제공한다. 완성도가 높은 테스트 구문은 다른 테스트 케이스의 일부 스텝 구문으로 재활용 가능하다.
<br />
GoCD는 CI/CD Tool 이며, GoCD를 통해 Firmware 변경 등의 조건을 주어 CI의 적용 가능하다.

### Framework
GoCD는 CI/CD Tool 이며,  아래와 같이 단일 Server와 다수의 Agent로 구성된다
<br />
<img src="{{ "/assets/img/content/TPAT/TPAT23.png" | absolute_url }}" alt="bay" class="post-pic"/>
<br />
PipeLine(Task)들을 자동으로 Agent에 할당하여 수행하는 구조이며
<br />
위와 같이 병렬 구조로 T-PAT를 수행 시 1개의 Agent는 1개의 Platform에 대한 Platform Automation Testing을 수행한다. 
<br />
Gauge를 GoCD와 연동 시 동시에 다수의 Platform에서 동일한 Test를 동시에 수행하고 보다 신속한 결과를 얻을 수 있다.
<br />
Gauge에서 작성된 Case들을 Pipeline 구조화 하여 시나리오 대로 구축을하고 git Server나 Abis와 연동을 하여 Trigger 조건을
<br />
설정해주면 Frimware 변경 시 Test가 이루어 지는 CI 구축이 가능하다.  
<br />
T-PAT는 다양한 Aging 검증 시나리오를 계획하고 있다. Traffic 인가 시 Docker Container를 활용하여 다양한 검증이 이루어 질 수 있도록 계획한다.
<br />
<img src="{{ "/assets/img/content/TPAT/TPAT4.png" | absolute_url }}" alt="bay" class="post-pic"/>

### Test Case
자동화 Test Case의 Category는 4가지로 구성한다.
<br />
① Platform별로 상이한 H/W기반 동작을 검증할 수 있는 Test
<br />
주 항목: Model인식, 인터페이스 시험, LLCF, Bypass, Watchdog
<br />
목적: Platform별로 상이한 H/W spec에 따른 특성 동작을 확인한다.
<br />
1) Platform인식
<br />
2) 인터페이스
<br />
3) Storage & Memory
<br />
4) H/W기반 기능인 LLCF, Bypass, Watchdog
<br />
② Platform별로 상이한 Software Spec을 검증할 수 있는 Test
<br />
주 항목: Platform별 정의된 Software capability spec검증 (Max session, Max Firewall Rule 적용 등…)
<br />
목적: Platform별로 Software에서 정의한 Spec의 정상 여부를 검증한다.
<br />
1) Platform별 최대 객체 확인
<br />
2) CPU affinity 검증
<br />
3) CPU core에 영향받는 기능과 Spec 검증
<br />
4) Memory에 영향받는 기능과 Spec 검증
<br />


③ Platform별로 상이한 S/W기반 동작을 검증할 수 있는 Test 
<br />
주 항목: Firmware 변경, acdump 저장과 같은 debugging 지원과 Error 검출, 데몬 on off 구동
<br />
목적: Firmware가 변경된 경우 특정 Platform에서 장애가 발생되지 않는지 확인한다.
<br />
1) Firmware 변경 검증
<br />
2) Error 검출
<br />
3) Debugging 지원
<br />
4) 데몬 on off 구동 검증
	
<br />
④ Platform별로 상이한 결과를 가져올 수 있는 Aging Test
<br />
주 항목: Reboot 반복 수행, Traffic 인가 등…
<br />
목적: H/W 및 S/W Spec과 임계치가 상이한 Platform들을 가지고 기 식별된 Aging step을 이용하여 반복 수행하고 Bug 검출 및 안정성을 확보한다.
<br />
1) Command 반복 수행 - 안정성
<br />
2) Reboot 반복 수행 - 안정성
<br />
3) Traffic 인가 - 안정성
