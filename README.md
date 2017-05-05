# Kerberos Example Using Tomcat on Windows Vagrant Boxes

## Software Installations

* Install Packer using `brew install packer` or from <a href="https://www.packer.io/intro/getting-started/install.html">here</a>
* Install Virtualbox
* Install Vagrant
* Install Vagrant *reload* plugin using `vagrant plugin install vagrant-reload`
* Install Vagrant *sysprep* plugin using `vagrant plugin install vagrant-windows-sysprep`

## Get Windows 2012 r2 server's vagrant box

Get the packer-windows repository
```bash
git clone http://github.com/diaclectic/packer-windows
cd packer-windows
```

Then build the Windows 2012 R2 artifact
```bash
packer build windows_2012_r2.json
```
It may take upto 6 hours, most of the time stuck on downloading and installing updates.

After the above command succeeds, you would find a file named `windows_2012_r2_virtualbox.box` in current directory.

Import the box in vagrant using:

```bash
vagrant box add windows_2012_r2 windows_2012_r2_virtualbox.box
```

## Get Vagrantfile and scripts

Clone this repository and cd inside it:

```bash
git clone git@github.com:deepubansal/kerberos-windows-vagrant.git
cd kerberos-windows-vagrant
```
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
* Provisioned with: Tomcat8, JDK8
* Tomcat enabled with Kerberos/Spnego Support for SSO with `tomcat` user
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

Open IE in client box and navigate to URL: `http://web:8080/hello_spnego.jsp`
If you see a page saying `Hello adrian.smith!`, that means SSO is successful via Kerberos


