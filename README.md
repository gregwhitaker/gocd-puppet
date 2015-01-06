gocd-puppet
===========

This is a repository to install GoCD using puppet.

Getting Started
---

Vagrant Box is based on the `hashicorp/precise32` box. Puppet module as of now has been tested only with debian distributions.
There may be some problems installing it on other package trees/distributions.

Make sure you have [vagrant][vagrant] and [Virtual Box][vbox] installed. To get a Go server and agent running on a local VM, run the following
commands:

    git clone https://github.com/piyush0101/gocd-puppet.git
    cd gocd-puppet
    vagrant up

[vagrant]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/
