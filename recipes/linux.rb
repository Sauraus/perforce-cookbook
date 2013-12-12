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

remote_file 'p4' do
  exe_file = node[:os] == "windows" ? "p4.exe" : "p4"
  source get_ftp_path(node[:p4][:version], exe_file)
  path "#{node[:p4][:install_dir]}/#{exe_file}"
  owner node[:p4][:owner]
  group node[:p4][:group]
  mode 0755
end

template "/etc/profile.d/perforce.sh" do
  mode 0755
  source "perforce.sh.erb"
  variables(:p4_port => node[:p4][:port],
            :p4_charset => node[:p4][:charset],
            :p4_user => node[:p4][:user],
            :p4_config => node[:p4][:config_filename])
end