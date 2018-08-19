Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.ssh.insert_key = false
  config.vm.provider "virtualbox" do |box|
     
     box.linked_clone = true
    # Display the VirtualBox GUI when booting the machine
     box.gui = false
        # Customize the amount of memory on the VM:
     box.memory = "512"
  end  
  config.vm.define "ansible" do |vb|
    # vb.vm.synced_folder ".", "/vagrant", type: "smb", smb_username: "Oleksii_Pasichnyk", mount_options: ["username=Oleksii_Pasichnyk"]
    vb.vm.synced_folder ".", "/vagrant", type: "rsync"
    vb.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"]
      end
 
    # Here and throughout some tweaks for creating a network: first is for separate network within a local machine
    # second is for my home usage, therefore DHCP is used

    # vb.vm.network :private_network, ip: "192.168.2.2"
    vb.vm.network "public_network", ip: "192.168.1.2"

    vb.vm.hostname = "master.ansible"
    # vb.vm.provision "file", source: "C:\\Users\\Oleksii_Pasichnyk\\.vagrant.d", destination: "/home/vagrant/id_rsa"
    vb.vm.provision "file", source: ENV['HOMEDRIVE']+ENV['HOMEPATH']+"\\.vagrant.d\\insecure_private_key", destination: "/home/vagrant/id_rsa"

    vb.vm.provision "ssh provision", type: "shell", run: "always" do |s|
      s.inline = <<-SHELL
      sudo cp /home/vagrant/id_rsa /home/vagrant/.ssh/id_rsa
      sudo rm -f /home/vagrant/id_rsa
      sudo chmod 600 /home/vagrant/.ssh/id_rsa
      sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
      SHELL
    end
    
    vb.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python-pip
    pip install -U pip
    pip install -U ansible
    yum install -y vim
    yum install -y git
  SHELL
  end

  config.vm.define "slave-1" do |vb1|
    vb1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "256"]
      end
    # vb1.vm.network :private_network, ip: "192.168.2.3"
    vb1.vm.network "public_network", ip: "192.168.1.3"
    vb1.vm.hostname = "www.django.edu"
    # vb1.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
    # vb1.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
    vb1.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "slave-2" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  # vb2.vm.network :private_network, ip: "192.168.2.4"
  vb2.vm.network "public_network", ip: "192.168.1.4"
  vb2.vm.hostname = "web1.django.edu"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "slave-3" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  vb2.vm.network "public_network", ip: "192.168.1.5"
  # vb2.vm.network :private_network, ip: "192.168.2.5"
  vb2.vm.hostname = "web2.django.edu"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "slave-4" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  vb2.vm.network "public_network", ip: "192.168.1.6"
    # vb2.vm.network :private_network, ip: "192.168.2.6"
  vb2.vm.hostname = "db1.django.edu"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "slave-5" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  # vb2.vm.network :private_network, ip: "192.168.2.7"
  vb2.vm.network "public_network", ip: "192.168.1.7"
  vb2.vm.hostname = "db2.django.edu"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
  end
end