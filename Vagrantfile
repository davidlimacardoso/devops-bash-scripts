Vagrant.configure("2") do |config|

    config.vm.define "scriptbox" do |scriptbox|
      scriptbox.vm.box = "geerlingguy/centos7"
      scriptbox.vm.network "private_network", ip: "192.168.10.12"
      scriptbox.vm.network "public_network"
      scriptbox.vm.hostname = "scriptbox"
      scriptbox.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    scriptbox.vm.provision "shell", inline: <<-SHELL
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
      sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    SHELL
  end

  config.vm.define "web01" do |web01|
    web01.vm.box = "geerlingguy/centos7"
    web01.vm.network "private_network", ip: "192.168.10.13"
    web01.vm.network "public_network"
    web01.vm.hostname = "web01"
    web01.vm.provision "shell", inline: <<-SHELL
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
      sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    SHELL
  end
  
  config.vm.define "web02" do |web02|
    web02.vm.box = "geerlingguy/centos7"
    web02.vm.network "private_network", ip: "192.168.10.14"
    web02.vm.network "public_network"
    web02.vm.hostname = "web02"
    web02.vm.provision "shell", inline: <<-SHELL
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
      sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    SHELL
  end

  config.vm.define "web03" do |web03|
    web03.vm.box = "ubuntu/bionic64"
    web03.vm.network "private_network", ip: "192.168.10.15"
    web03.vm.network "public_network"
    web03.vm.hostname = "web03"
    web03.vm.provision "shell", inline: <<-SHELL
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
      sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    SHELL
  end
end
