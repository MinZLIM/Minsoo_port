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


#### Table of Contents
1. [L7 Server List](#l7-server-list)
    * [Web Server](#web-server)
    * [MAIL Server](#mail-server)
    * [FTP Server](#ftp-server)
    * [DNS Server](#dns-server)
2. [Auth Server](#auth-server)
    * [RADIUS](#radius)
    * [LDAP](#ldap)
    * [TACAS+](#tacas+)
3. [OpenStack](#openstack)
    * [운영환경](#운영환경)
    * KeyStone(#keystone)
    * Nova(#nova)
    * Neutron(#neutron)
    * Glance(#glance)
    * Cinder(#cinder)
    * Horizon(#horizon)

#### L7 Server List
TrusGuard 의 Content Filter 기능을 QA 하기 위해서는 다양한 조건의 L7 프로토콜에 대한 지식 및 운영 환경이 필요하며 담당기능 진행간 하기의 환경에서 QA 를 진행하였음. 

<br />

##### Web Server 
 운영체제로 윈도우 2019 서버와 Centos7 을 사용하여 웹 서버를 구축하였다. 
 <br />
 윈도우 2019 의 겨웅 XXXX 를 사용하였으며 Centos7 의 경우 Apache2 와 PHP 를 연동하여 파일 업로드 / 다운로드가 가능하게 구축하였다. 
 
<br />

##### MAIL Server
 웹 서버와 마찬가지로 운영체제는 윈도우 2019 서버와 Centos7 을 사용하여 구축하였다. 
 <br />
 윈도우 2019 에서는 Simple EmailSender 를 사용하여 smtp 와 pop3 를 사용하였다. 
 <br />
 Centos7 의 경우는 SMTP 로 postfix 를 사용하였으며 , pop3 의 경우 dovecot 을 사용하여 메일 서버를 구축하였다. 
 <br />
 sasl 인증여부에 따라 XXX 되는 이슈가 있어 해당 이슈 확인을 위해 SASL 설정을 ON 시키며 구동하고 있다. 

<br />

##### FTP Server
 FTP 서버의 경우 window 10 환경과 , Centos7 환경을 사용하여 구축하였다. 
 <br />
 Window 10 환경에서는 FileZilla 를 사용하여 FTP , FTPS 를 사용할 수 있으며 , Centos7 은 vsftpd 를 통해서 FTP 서버를 구축하였다. 

<br />

#### Auth Server 
 TrusGuard 의 사용자 인증 기능을 사용하기 위해서 다양한 인증서버 운영을 필요로 하여 docker 와 vm 환경을 통해 인증서버를 구축하였다. 

<br />

##### RADIUS
 xxx
<br />

##### ldap
 xxx
<br />

##### tacas+
 xxx
<br />

#### Openstack
 TrusGuard 의 Cloud 가상화 도입에 의하여 vTG 로 네이밍 되어 AWS, NHN cloud ,KaKao icoud , Naver cloud 에 입점되었다. 네트워크 QA 팀에서는 각 CSP 에서 vTG 인스턴스를 생성하며 테스트를 진행하고 있으며 해당 CSP 의 사용에 제약이 있을 시 대안을 위해 Openstack 클라우드 환경을 필요로 하게 되었다. 

##### 운영환경
 TrusGuard 10000B 플랫폼을 개조하여 우분투20.04 를 설치하였으며 OpenStack 버전은 Zena 를 사용한다. 
 현재 추가적인 애플리케이션 운영은 필요하지 않아 기본 Starter Pack 으로 구축되었다.
 <img src="{{ "/assets/img/work/openstack_starter.png" | absolute_url }}" alt="bay" class="post-pic"/>


##### KeyStone
##### Nova
##### Neutron
##### Glance
##### Cinder
##### Horizon
