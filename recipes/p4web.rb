#
# Cookbook Name:: perforce
# Recipe:: p4web
#
# Copyright 2014, Antek Baranski
#

class Chef::Resource::RemoteFile
  include PerforceFtp
end

group node['perforce']['p4web']['group'] do
  action :create
end

user node['perforce']['p4web']['owner'] do
  system true
  gid node['perforce']['p4web']['group']
  action :create
end

directory node['perforce']['p4web']['bin_dir'] do
  owner node['perforce']['p4web']['owner']
  group node['perforce']['p4web']['group']
  permission = (node['perforce']['p4web']['bin_dir'] == node['perforce']['p4']['bin_dir'] && 0755) || 0700
  mode permission
  recursive true
end

exe_file = node[:os] == "windows" ? "p4web.exe" : "p4web"
ftp_path =  get_ftp_path(node['perforce']['p4web']['version'], exe_file)

remote_file 'p4web' do
  source ftp_path
  path "#{node['perforce']['p4web']['bin_dir']}/#{exe_file}"
  owner node['perforce']['p4web']['owner']
  group node['perforce']['p4web']['group']
  mode 0700
  notifies :restart, "service[p4web]", :delayed
end

template "/etc/init.d/p4web" do
  mode 0755
  source "p4web.erb"
end

service 'p4web' do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
