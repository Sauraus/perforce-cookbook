#
# Cookbook Name:: perforce
# Recipe:: linux
#
# Author:: Kyle Allan (<kallan@riotgames.com>)
#
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#
directory node[:p4][:install_dir] do
  recursive true
end

perforce_p4 node[:p4][:version] do
  directory node[:p4][:install_dir]
  sixty_four node[:kernel][:machine] == "x86_64"
end

template "/etc/profile.d/perforce.sh" do
  mode 0755
  source "perforce.sh.erb"
  variables(:p4_port => node[:p4][:port],
            :p4_charset => node[:p4][:charset],
            :p4_user => node[:p4][:user],
            :p4_config => node[:p4][:config_filename])
end