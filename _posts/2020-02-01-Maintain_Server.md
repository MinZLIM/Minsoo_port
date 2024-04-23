---
layout: post
title:  "Maintain Server info"
date:   2020-02-01 24:00:00
blurb: "A look at an example post using Bay Jekyll theme."
og_image: /assets/img/content/post-example/Banner.jpg
---
<br />
<br />

본 장에서는 Network QA 업무 지행 및 개인프로젝트 진행 중 지속적인 유지보수가 필요한 사항들에 대해서 관리한다.

<br />


## Table of Contents
1. [Content Server List](#content-server-list)
2. [Auth Server](#auth-server)
3. [OpenStack](#openstack)
    * [운영환경](#운영환경)
    * [KeyStone](#keystone)
    * [Nova](#nova)
    * [Neutron](#neutron)
    * [Glance](#glance)
    * [Cinder](#cinder)
    * [Horizon](#horizon)

## Content Server List
TrusGuard 의 프로토콜 별 트래픽 기능을 검증하기 위해서는 다양한 조건의 L7 프로토콜에 대한 지식 및 운영 환경이 필요하며 담당기능 진행간 하기의 환경에서 QA 를 진행하였음.<br />
검증 기능
 > Object : Service <br />
 > FIrewall : Policy , NAT , Blacklist , WhiteList <br />
 > Content Filter : Webfilter , Antivirus, mal site, C&C, etc

### Server env
<table>
  <tr>
    <th>Protocol</th>
    <th>OS</th>
    <th>Tool</th>
  </tr>
  <tr>
    <td>HTTP </td>
    <td>Window Server2019 VM, Centos7 VM</td>
    <td>IIS,Apache2</td>
  </tr>
  <tr>
    <td>SMTP,POP3</td>
    <td>Window Server2019 VM, Centos7 VM</td>
    <td>Simple Email Sender , Postfix,dovecot</td>
  </tr>
    <tr>
    <td>FTP</td>
    <td>Window 10 Enterprise, Centos7 VM</td>
    <td>FileZilla, vsftpd</td>
  </tr>
</table>



<br />

## Auth Server 
 TrusGuard 의 사용자 및 관리자 인증 기능을 사용하기 위해서 다양한 인증서버 운영을 필요로 하여 docker 와 vm 환경을 통해 인증서버를 구축하였다.  <br />
검증 기능
 > Object : 사용자 인증 객체 <br />
 > FIrewall : Auth Policy  <br />
 > System : admin Auth

### Server env
<table>
  <tr>
    <th>Protocol</th>
    <th>OS</th>
    <th>Tool</th>
  </tr>
  <tr>
    <td>Radius</td>
    <td>Centos7 Docker image</td>
    <td>RADIUS</td>
  </tr>
  <tr>
    <td>LDAP</td>
    <td>Centos7 VM</td>
    <td>Slapd</td>
  </tr>
    <tr>
    <td>tacas+</td>
    <td>Centos7 Docker image</td>
    <td></td>
  </tr>
</table>



## Openstack
 TrusGuard 의 Cloud 가상화 도입에 의하여 vTG 로 네이밍 되어 AWS, NHN cloud ,KaKao icoud , Naver cloud 에 입점되었다. 네트워크 QA 팀에서는 각 CSP 에서 vTG 인스턴스를 생성하며 테스트를 진행하고 있으며 해당 CSP 의 사용에 제약이 있을 시 대안을 위해 Openstack 클라우드 환경을 필요로 하게 되었다. 

### 운영환경
 신규 서버 구매에 비용 이슈가 있어 기존 운영하던 TrusGuard 10000B 플랫폼을 개조하여 우분투20.04 를 설치하였으며 OpenStack 버전은 Xena 를 사용하여 운영하였다.  
 현재 추가적인 애플리케이션 운영은 필요하지 않아 기본 Starter Pack 으로 구축되었다.(+Horizon)
<br />
<img src="{{ "/assets/img/work/openstack_starter.png" | absolute_url }}" alt="bay" class="post-pic"/>


### KeyStone
 OpenStack 에서 인증을 담당하는 서비스.
<br />

### Nova
 컴퓨팅 기능을 담당하는 서비스 
<br />

### Neutron
 네트워크 기능을 담당하는 서비스 <br />
  ovs 를 통한 논리 인터페이스 및 openv switch 모듈을 활용하여 실제 물리서버의 인터페이스와 openstack 논리 인터페이스를 매핑시켜 사용. 
<br />

### Glance
 가상 시스템 이미지 구축 서비스
<br />

### Cinder
 볼륨 관리 서비스
<br />

### Horizon
 ui 표시 서비스
