VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "opscode_centos-7.0_chef-provisionerless"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box"

  # Set the VirtualBox Configration
  config.vm.provider "virtualbox" do |vb|
    # Change memory size
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Install chef
  config.vm.provision :shell, :inline => "curl -L 'https://omnitruck.chef.io/install.sh' | sudo bash"

  # provisioning with chef solo.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./provision/chef/cookbooks","./provision/chef/site-cookbooks"]
    chef.add_recipe "chkconfig"
    chef.add_recipe "selinux"
    chef.add_recipe "yum"
    chef.add_recipe "ntp"
    chef.add_recipe "nkf"
    chef.add_recipe "epel"
    chef.add_recipe "remi"
    chef.add_recipe "rpmforge"
  end

end
