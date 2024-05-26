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

# Table of Contents
1. [Content Server List](#content-server-list)
2. [Auth Server](#auth-server)

# Content Server List
TrusGuard 의 프로토콜 별 트래픽 기능을 검증하기 위해서는 다양한 조건의 L7 프로토콜에 대한 지식 및 운영 환경이 필요하며 담당기능 진행간 하기의 환경에서 QA 를 진행하였음.<br />
검증 기능
 > Object : Service <br />
 > FIrewall : Policy , NAT , Blacklist , WhiteList <br />
 > Content Filter : Webfilter , Antivirus, mal site, C&C, etc

## Server env
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
    }
</style>
</head>
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
</html>


<br />

# Auth Server 
 TrusGuard 의 사용자 및 관리자 인증 기능을 사용하기 위해서 다양한 인증서버 운영을 필요로 하여 docker 와 vm 환경을 통해 인증서버를 구축하였다.  <br />
검증 기능
 > Object : 사용자 인증 객체 <br />
 > FIrewall : Auth Policy  <br />
 > System : admin Auth

## Server env
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
    }
</style>
   </head>

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
</html>



