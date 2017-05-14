# Kerberos Example Using Tomcat on Windows Vagrant Boxes

## Software Installations

* Install Virtualbox
* Install Vagrant
* Install Vagrant *reload* plugin using `vagrant plugin install vagrant-reload`
* Install Vagrant *sysprep* plugin using `vagrant plugin install vagrant-windows-sysprep`

## Get Vagrantfile and scripts

Clone this repository and cd inside it:

```bash
git clone git@github.com:deepubansal/kerberos-windows-vagrant.git
cd kerberos-windows-vagrant
```

Vagrant box used (standard windows 2012 r2 server) is availble on Hashicorp Atlas (Vagrant cloud): https://vagrantcloud.com/kensykora/boxes/windows_2012_r2_standard

## Install Domain controller Vagrant Box

```bash
vagrant up dc --provider virtualbox
```
It will reboot no. of times. Wait until the vagrant command ends.
This will create a windows box with an Active Directory on Domain `WINDOMAIN.LOCAL`. It will also add one Service Principal Name and map it to user `tomcat`. Keytab file will be generated in `resources` directory. It will also create three users from `scripts/users.csv` file.
Hostname: `dc` and FQDN: `dc.windomain.local`


## Install Web Server Vagrant Box

```bash
vagrant up web --provider virtualbox
```
Box with following details:
* Hostname: `web`
* FQDN: `web.windomain.local`
* Domain: `WINDOMAIN`
* Provisioned with: Tomcat8, JETTY 9.4.5, JDK8
* Tomcat enabled with Kerberos/Spnego Support for SSO with `tomcat` user on port 8080
* Jetty enabled with Kerberos/Spnego Support for SSO with `tomcat` user on port 9999
* AutoLogon set to user `tomcat`

## Install Client Vagrant Box
```bash
vagrant up client --provider virtualbox
```
Box with following details:
* Hostname: `client`
* FQDN: `client.windomain.local`
* Domain: `WINDOMAIN`
* AutoLogon set to user `adrian.smith`

## Testing Single Sign On:

### Tomcat
Open IE in client box and navigate to URL: `http://web:8080/SampleWebApplication/hello_spnego.jsp`
If you see a page saying `Hello adrian.smith!`, that means SSO is successful via Kerberos on Tomcat.

### Jetty
Open IE in client box and navigate to URL: `http://web:9999/SampleWebApplication/hello_spnego.jsp`
If you see a page saying `Hello adrian.smith!`, that means SSO is successful via Kerberos on Jetty.
