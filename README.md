Features
========
- Debian boxes from lenny till wheezy
- UTC set
- /var /usr /home /tmp are on separate partitions
- /home /tmp are mounted with nosuid, nodev and noexec

Requirements
========
- packer
- vagrant
- virtualbox or/and vmware fusion 

Packer Install 
========

#### OSX via homebrew:

```shell
$ brew tap homebrew/binary
$ brew install packer
```

#### All else:

[Packer Setup Instructions](http://www.packer.io/intro/getting-started/setup.html)

Box Build
========

#### 1. Clone
```shell
$ git clone https://github.com/lxhunter/packer-templates.git
# move into the folder
$ cd packer-templates/templates/debian
```

#### 2. a.) build for all providers (virtualbox && vmware)
```shell
$ packer build debian-lenny-5.0.10-amd64-netinst.json
```

#### 2. b.) build only for virtualbox
```shell
$ packer build -only=virtualbox-iso debian-lenny-5.0.10-amd64-netinst.json
```

#### 2. c.) build only for vmware
```shell
$ packer build -only=vmware-iso debian-lenny-5.0.10-amd64-netinst.json
```
#### 3. ... a lot of building going on ...

#### 4. a.) adding virtualbox box to vagrant 
```shell
$ vagrant box add debian-lenny-5.0.10-amd64-netinst-provisionerless ../../virtualbox/debian-lenny-5.0.10-amd64-netinst-provisionerless.box
```

#### 4. b.) adding vmware box to vagrant 
```shell
$ vagrant box add debian-lenny-5.0.10-amd64-netinst-provisionerless ../../vmware/debian-lenny-5.0.10-amd64-netinst-provisionerless.box
```

#### 5. enjoy fresh packed boxes
