gocd-puppet
===========

This is a repository to install GoCD using puppet.

Getting Started
---

Vagrant Box is based on the `hashicorp/precise32` box. If you do not have this box, add it with

    vagrant box add hashicorp/precise32

Puppet module as of now has been tested only with SLES11 and Debian distributions.
There may be some problems installing it on other package trees/distributions.

Make sure you have [Vagrant][vagrant] and [Virtual Box][vbox] installed. To get a Go server and agent running on a local VM, run the following commands:

    git clone https://github.com/gregwhitaker/gocd-puppet.git
    cd gocd-puppet
    vagrant up

[vagrant]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/

Wait while Vagrant sets up and provisions your VM.

After vagrant finishes, you can access the Go server at `http://192.168.192.169:8153`. This should be a fully functional Go setup. There is a server and agent co located on the same VM.

Installation on a node
---

In a typical CI/CD setup, you would probably require Go server and agent running on separate VMs/Containers/Physical Boxes. There are tags which can limit the puppet catalog run to install just the Go server or the Go agent. If you want to install the Go server on a box, `ssh` into that node, install `puppet` and run the following. If you are running the SLES11 image from puppet labs used above, it has puppet already installed:

    git clone https://github.com/gregwhitaker/gocd-puppet.git
    cd gocd-puppet
    puppet apply --tags go-server --modulepath=modules/ manifests/site.pp
    
To install Go agent, make sure that Go agent is pointing to the correct IP/Host & Port number of the Go server. Modify `manifests/vars.pp` file to reflect Go servers IP/Host & Port. After this, run the following on the machine you are wanting to install Go agent on. Make sure `puppet` is installed before running the commands:

    git clone https://github.com/gregwhitaker/gocd-puppet.git
    cd gocd-puppet
    puppet apply --tags go-agent --modulepath=modules/ manifests/site.pp
