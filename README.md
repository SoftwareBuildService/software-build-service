software-build-service
======================

### Introduction

This project provides a set of Puppet modules in order to install and configure the following tools on an Ubuntu (Debian) machine:

* Jenkins - Continuous Integration Server
* Nexus - Maven Artifact Repository
* Sonar - Static Code Analysis

There is an Apache server, configured as a proxy server which allows access via HTTPS or HTTP. Additionally an LDAP server is configured as a user and group database. This combination provides a Single-Sign-On (SSO) setup where access to Jenkins jobs, Nexus repositories, or Sonar projects will be determined by the membership of a user's LDAP groups.


### Prerequisites

puppet module install puppetlabs/mysql

