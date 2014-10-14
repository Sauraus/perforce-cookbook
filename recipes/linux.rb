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

directory node['perforce']['p4']['bin_dir'] do
  recursive true
end

exe_file = node[:os] == "windows" ? "p4.exe" : "p4"
ftp_path =  get_ftp_path(node['perforce']['p4']['version'], exe_file)

remote_file 'p4' do
  source ftp_path
  path "#{node['perforce']['p4']['bin_dir']}/#{exe_file}"
  owner node['perforce']['p4']['owner']
  group node['perforce']['p4']['group']
  mode 0755
  checksum node['perforce']['p4']['checksum']
end

template "/etc/profile.d/perforce.sh" do
  owner 'root'
  group 'root'
  mode 0755
  source "perforce.sh.erb"
end
