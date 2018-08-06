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
  config.vm.define "ansible-day-1" do |vb|
    vb.vm.synced_folder ".", "/vagrant", type: "smb", smb_username: "Oleksii_Pasichnyk"
    vb.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "512"]
      end
 
    vb.vm.network :private_network, ip: "192.168.56.21"
    vb.vm.hostname = "day1.ansible.cdp"
    vb.vm.provision "file", source: "id_rsa", destination: "/home/vagrant/id_rsa"
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
  SHELL
  end

  config.vm.define "ansible-slave-1" do |vb1|
    vb1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "256"]
      end
    vb1.vm.network :private_network, ip: "192.168.56.22"
    vb1.vm.hostname = "slave1.ansible.cdp"
    vb1.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
    vb1.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
    vb1.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "ansible-slave-2" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  vb2.vm.network :private_network, ip: "192.168.56.23"
  vb2.vm.hostname = "slave2.ansible.cdp"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "ansible-slave-3" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  vb2.vm.network :private_network, ip: "192.168.56.24"
  vb2.vm.hostname = "slave3.ansible.cdp"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
config.vm.define "ansible-slave-4" do |vb2|
  vb2.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "256"]
    end
  vb2.vm.network :private_network, ip: "192.168.56.25"
  vb2.vm.hostname = "slave4.ansible.cdp"
 # vb2.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
 # vb2.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
  vb2.vm.provision "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y python
    SHELL
end
end