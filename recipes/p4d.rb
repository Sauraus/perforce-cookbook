#
# Cookbook Name:: perforce
# Recipe:: p4d
#
# Copyright 2013, Roblox Inc.
#

class Chef::Resource::RemoteFile
  include PerforceFtp
end

group node['perforce']['p4d']['group'] do
  action :create
end

user node['perforce']['p4d']['owner'] do
  system true
  gid node['perforce']['p4d']['group']
  action :create
end

directory node['perforce']['p4d']['bin_dir'] do
  owner node['perforce']['p4d']['owner']
  group node['perforce']['p4d']['group']
  permission = (node['perforce']['p4d']['bin_dir'] == node['perforce']['p4']['bin_dir'] && 0755) || 0700
  mode permission
  recursive true
end

directory node['perforce']['p4d']['root_dir'] do
  owner node['perforce']['p4d']['owner']
  group node['perforce']['p4d']['group']
  mode 0700
  recursive true
end

if node['perforce']['p4d']['depots_dir'] != node['perforce']['p4d']['root_dir']
  directory node['perforce']['p4d']['depots_dir'] do
    owner node['perforce']['p4d']['owner']
    group node['perforce']['p4d']['group']
    mode 0700
    recursive true
  end

  node['perforce']['p4d'][:depots].each { |d|
    directory d do
      path "#{node['perforce']['p4d']['depots_dir']}/#{d}"
      owner node['perforce']['p4d']['owner']
      group node['perforce']['p4d']['group']
      mode 0700
    end

    link d do
      target_file "#{node['perforce']['p4d']['root_dir']}/#{d}"
      to "#{node['perforce']['p4d']['depots_dir']}/#{d}"
    end
  }
end

directory node['perforce']['p4d']['journal']['dir'] do
  owner node['perforce']['p4d']['owner']
  group node['perforce']['p4d']['group']
  mode 0700
  recursive true
  action :create
end if node['perforce']['p4d']['journal']['enabled']

directory node['perforce']['p4d']['log_dir'] do
  owner node['perforce']['p4d']['owner']
  group node['perforce']['p4d']['group']
  mode 0700
  recursive true
  action :create
end

directory node['perforce']['p4d']['audit']['dir'] do
  owner node['perforce']['p4d']['owner']
  group node['perforce']['p4d']['group']
  mode 0700
  recursive true
  action :create
end if node['perforce']['p4d']['audit']['enabled']


exe_file = node[:os] == "windows" ? "p4d.exe" : "p4d"
ftp_path =  get_ftp_path(node['perforce']['p4d']['version'], exe_file)

remote_file 'p4d' do
  source ftp_path
  path "#{node['perforce']['p4d']['bin_dir']}/#{exe_file}"
  owner node['perforce']['p4d']['owner']
  group node['perforce']['p4d']['group']
  mode 0700
end

template "/etc/init.d/p4d" do
  mode 0755
  source "p4d.erb"
end

service "p4d" do
  supports :status => true, :restart => true, :stop => true, :enable => true
  action [ :enable, :start ]
end
