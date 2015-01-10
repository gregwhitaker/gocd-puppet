VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "sles11"

  config.vm.network "private_network", ip: "192.168.192.169"

  config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "site.pp"
    puppet.module_path = "modules"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
    
end
