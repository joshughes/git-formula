# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "./.vagrant-salt", "/srv/salt", id: "vagrant-root"

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Leverage package cache, if available
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provision :saltdeps do |deps|
    deps.checkout_path =  "./.vagrant-salt/deps"
    deps.deps_path     =  "./.vagrant-salt/saltdeps.yml"
  end

  config.vm.provision :file, source: "./.vagrant-salt/minion", destination: "/tmp/minion"
  # Provision VM with current formula, in masterless mode
  config.vm.provision :salt do |salt|
    salt.minion_config = "./.vagrant-salt/minion"
    salt.run_highstate = true
    salt.install_type = 'git v2015.5.3'
    salt.bootstrap_options = "-P -c /tmp"
    salt.colorize = true
    salt.verbose = true
  end

  # Run serverspec tests
  if Vagrant.has_plugin?("vagrant-serverspec")
    config.vm.provision :serverspec do |spec|
      spec.pattern = './spec/*_spec.rb'
    end
  end
end
