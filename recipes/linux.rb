#
# Cookbook Name:: perforce
# Recipe:: linux
#
# Copyright 2012, Riot Games
# Copyright 2013, Roblox Inc.
#

user node['perforce']['p4']['owner'] do
  system true
  action :create
end

directory node['perforce']['p4']['install_dir'] do
  recursive true
end

remote_file 'p4' do
  exe_file = node[:os] == "windows" ? "p4.exe" : "p4"
  source get_ftp_path(node['perforce']['p4']['version'], exe_file)
  path "#{node['perforce']['p4']['install_dir']}/#{exe_file}"
  owner node['perforce']['p4']['owner']
  group node['perforce']['p4']['group']
  mode 0755
end

template "/etc/profile.d/perforce.sh" do
  owner 'root'
  group 'root'
  mode 0755
  source "perforce.sh.erb"
  variables(:p4_port => node['perforce']['p4']['port'],
            :p4_charset => node['perforce']['p4']['charset'],
            :p4_user => node['perforce']['p4']['user'],
            :p4_config => node['perforce']['p4']['config_filename'])
end
