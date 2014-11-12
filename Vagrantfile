# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-6.5-64-puppet"

  # install puppet modules from the forge
  config.vm.provision :shell do |shell|
    shell.inline = "puppet module install puppetlabs-stdlib"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.options        = "--verbose"
    puppet.module_path    = "modules"
    puppet.manifests_path = "tests"
    puppet.manifest_file  = "init.pp"
  end
end
