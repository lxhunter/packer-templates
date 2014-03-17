Features
========
- Debian boxes from lenny till wheezy
- UTC set
- /var /usr /home /tmp are on separate partitions
- /home /tmp are mounted with nosuid, nodev and noexec

Todo
========
add Ubuntu boxes for:
- 11.04 Natty Narwhal (maybe)
- 11.10 Oneiric Ocelot (maybe)
- 12.04 LTS Precise Pangolin
- 12.10 Quantal Quetzal
- 13.04 Raring Ringtail 
- 13.10 Saucy Salamander

Requirements
========
- [packer](http://www.packer.io)
- [vagrant](http://www.vagrantup.com)
- [virtualbox](https://www.virtualbox.org)
- [vmware fusion](http://www.vmware.com/de/products/fusion)
- [vagrant vmware fusion license](http://www.vagrantup.com/vmware)

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

Quote
========
In the words of Friedrich Nietzsche:

> "To live is to suffer, to survive is to find some meaning in the suffering."

Credits
========

Heavily stolen from: [basebox-packer](https://github.com/misheska/basebox-packer/)

Contribute
==========

[Tutorial](http://kbroman.github.io/github_tutorial/pages/fork.html)

License and Author
==================

Author:: [Alexander Jäger](https://github.com/lxhunter)

Copyright 2014

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
