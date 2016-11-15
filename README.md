# vrf-demo-ansible
Demo L3 VRF-lite Tenant Isolation on Cumulus Linux
========================
This Github repository contains the configuration files necessary for setting up a VRF-lite infrastructure using Cumulus Linux and Quagga on the [Reference Topology](http://github.com/cumulusnetworks/cldemo-vagrant).  Only Server01->Server04, Leaf01->Leaf04 and Spine01->Spine02 are used.

Ansible is the mechanism which is used to deploy the VRF configuration onto all components. As a result, this demo depends on [cldemo-vagrant](https://github.com/CumulusNetworks/cldemo-vagrant) to run.

Quickstart: Run the demo
------------------------
    git clone https://github.com/CumulusNetworks/cldemo-vagrant
    cd cldemo-vagrant
    vagrant up oob-mgmt-server oob-mgmt-switch
    vagrant up leaf01 leaf02 leaf03 leaf04 spine01 spine02 server01 server02 server03 server04
    vagrant ssh oob-mgmt-server
    sudo su - cumulus
    git clone https://github.com/rdarbha/vrf-demo-ansible
    cd vrf-demo-ansible
    ansible-playbook deploy_network.yml
    ssh leaf01
    sudo vtysh -c "show ip route vrf all"


![Topology](vrf.png)

Requirements
----------------------
[Vagrant](https://www.vagrantup.com/)

and

[VirtualBox](https://www.virtualbox.org/wiki/Downloads) or [KVM](http://www.linux-kvm.org/page/Downloads)

[Instructions in installing virtualization software](https://docs.cumulusnetworks.com/display/VX/Using+Cumulus+VX+with+KVM#UsingCumulusVXwithKVM-UsingCumulusVXwithVagrantandlibvirt/QEMU/KVM)

Factory-reset a device
----------------------
    vagrant destroy -f leaf01
    vagrant up leaf01

Destroy the entire topology
---------------------------
    vagrant destroy -f

KVM Support
---------------------------
By default this Vagrantfile is setup for Virtualbox.  To use this Demo for KVM use the Vagrantfile-kvm

    mv Vagrantfile-kvm Vagrantfile

All other directions remain the same

---------------------------------------

![Cumulus icon](http://cumulusnetworks.com/static/cumulus/img/logo_2014.png)

### Cumulus Linux
---------------------------------------
Cumulus Linux is a software distribution that runs on top of industry standard networking hardware. It enables the latest Linux applications and automation tools on networking gear while delivering new levels of innovation and ﬂexibility to the data center.

For further details please see: [cumulusnetworks.com](http://www.cumulusnetworks.com)

### Virtualizing a Network with Cumulus VX
---------------------------------------
[Cumulus VX](https://cumulusnetworks.com/cumulus-vx/) is a virtual machine
produced by Cumulus Networks to simulate the user experience of configuring a
switch using the Cumulus Linux network operating system.
[Vagrant](https://www.vagrantup.com/) is an open source tool for quickly
deploying large topologies of virtual machines. Vagrant and Cumulus VX can be
used together to build virtual simulations of production networks to validate
configurations, develop automation code, and simulate failure scenarios.

Vagrant topologies are described in a Vagrantfile, which is a Ruby program that
tells Vagrant which devices to create and how to configure their networks.
`vagrant up` will execute the Vagrantfile and create the reference topology
using Virtualbox. It will also use Ansible to configure the out-of-band
management network.