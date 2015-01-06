gocd-puppet
===========

This is a repository to install GoCD using puppet.

Getting Started
---

Vagrant Box is based on the `hashicorp/precise32` box. If you do not have this box, add it with

    vagrant box add hashicorp/precise32

Puppet module as of now has been tested only with debian distributions.
There may be some problems installing it on other package trees/distributions.

Make sure you have [Vagrant][vagrant] and [Virtual Box][vbox] installed. To get a Go server and agent running on a local VM, run the following commands:

    git clone https://github.com/piyush0101/gocd-puppet.git
    cd gocd-puppet
    vagrant up

[vagrant]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/

Wait while Vagrant sets up and provisions your VM.

After vagrant finishes, you can access the Go server at `http://192.168.192.169:8153`. This should be a fully functional Go setup. There is a server and agent co located on the same VM.
