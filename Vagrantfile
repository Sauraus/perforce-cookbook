VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.host_name = "perforce-berkshelf"

  config.vm.box = "opscode-centos-6.5-provisionerless"

  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  config.omnibus.chef_version = :latest

  config.vm.network :private_network, ip: "33.33.33.10"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'p4d' => {
          'depots' => ['depot', 'spec']
      }
    }

    chef.run_list = [
      "recipe[perforce::p4d]",
      "recipe[perforce::linux]"
    ]
  end
end
