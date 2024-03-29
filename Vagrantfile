# -*- mode: ruby -*-
# vi: set ft=ruby :
CONFIG_PATH = File.join(File.dirname(__FILE__), "config.yml")
USER_CONFIG = File.exist?(CONFIG_PATH) ? YAML.load_file(CONFIG_PATH) : {}

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/focal64"
  config.vm.box_url = "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64-vagrant.box"

  config.ssh.forward_agent = true
  # config.ssh.private_key_path = "~/.ssh/id_rsa"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  if Vagrant.has_plugin?("vagrant-disksize")
    config.disksize.size = "30GB"
  end

  # http://tmatilai.github.io/vagrant-proxyconf/
  if Vagrant.has_plugin?("vagrant-proxyconf")
    proxy_conf = USER_CONFIG.fetch("proxy", {})
    config.proxy.http = proxy_conf.fetch("http", "")
    config.proxy.https = proxy_conf.fetch("https", "")
    config.proxy.no_proxy = proxy_conf.fetch("no_proxy", "")
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  USER_CONFIG.fetch("forwarded_ports", []).each do |guest, host|
    config.vm.network "forwarded_port", guest: guest, host: host, auto_correct: true
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "data", "/data", create: true, group: "root", owner: "root", mount_options: ["dmode=774","fmode=775"]
  USER_CONFIG.fetch("shared_folders", []).each do |host_folder, guest_folder|
    config.vm.synced_folder host_folder.to_s, guest_folder.to_s
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    vb.cpus = 2
    vb.memory = "2048"

    # Speed up machine startup by using linked clones
    vb.linked_clone = true
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", run: "once", path: "scripts/set_apt_mirror.sh"
  config.vm.provision "ansible_local", run: "once" do |ansible|
    ansible.playbook = "ansible/vagrant.yml"
  end
end
