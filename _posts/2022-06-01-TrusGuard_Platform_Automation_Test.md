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


#### Table of Contents
1. [개요](#개요)
    * [T-PAT 목표](#T-PAT-목표)
    * [T-PAT 배경](#T-PAT-배경)
2. [구현과제](#구현과제)
    * [TG Platform 별 검증 효율화를 위한 환경 구축](#TG-Platform-별-검증-효율화를-위한-환경-구축)
    * [TG Platform 기반의 자동화 검증 환경 구축](#TG-Platform-기반의-자동화-검증-환경-구축)
3. [물리구성](#물리구성)
    * [T-PAT 물리 구성 규칙](#T-PAT-물리-구성-규칙)
    * [T-PAT 물리 구성 세부 내용](#T-PAT-물리-구성-세부-내용)

#### 개요
##### T-PAT 목표
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

<br />
##### T-PAT 배경
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

#### 구현과제
<br />
##### TG Platform 별 검증 효율화를 위한 환경 구축
TrusGuard Line-up 중 25종 선별 및 모든 종류의 Ethernet Driver를 사용하는 환경을 구축한다.
Platform별 비교 시험과 검증이 가능한 자동화 구축 환경을 제공한다.


<br />

##### TG Platform 기반의 자동화 검증 환경 구축
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
#### 물리구성
<br />
##### T-PAT 물리 구성 규칙
<br />
TrusGuard Line-up 중 20종 선별 및 모든 종류의 Ethernet Driver를 사용하는 환경을 구축한다.
<br />
<규칙>
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
<br />
##### T-PAT 물리 구성 규칙
<br />
자동화 환경에서 Route mode, Bridge mode의 자유로운 설정이 가능한 기초 물리 구성을 한다.
<br />
전체적인 물리구성도는 아래와 같고 eth2, eth3을 통해 모든 Line-up은 Switch 상,하단으로 연결되어 있다. eth4, eth5는 각각의 TG끼리 상,하단으로 연결되어 있다.
<br />
상하단의 Switch는 Worker 혹은 계측기와 연결을 할 수 있도록 하여 전체 Line-up에 대한 Traffic Test가 될 수 있도록 구축을 하였다.
<br />
Test목적에 자동화를 구축하여 Switch나 TG를 control하여 Bridge mode, Route mode를 선택하여 Traffic이 인가될 수 있는 기초 환경을 구축, 검증이 이루어질 수 있도록 한다.
<br />
Switch나 TG를 control하여 Bridge mode, Route mode를 선택하여 Traffic이 인가될 수 있는 기초 환경의 예
<br />
