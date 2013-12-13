#
# Cookbook Name:: perforce
# Recipe:: p4d
#
# Copyright 2013, Roblox Inc.
#

class Chef::Resource::RemoteFile
  include PerforceFtp
end

group node[:p4d][:group] do
  action :create
end

user node[:p4d][:owner] do
  system true
  gid node[:p4d][:group]
  action :create
end

directory node[:p4d][:install_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  permission = (node[:p4d][:install_dir] == node[:p4][:install_dir] && 0755) || 0700
  mode permission
  recursive true
end

directory node[:p4d][:root_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
  recursive true
end

if node[:p4d][:depots_dir] != node[:p4d][:root_dir]
  directory node[:p4d][:depots_dir] do
    owner node[:p4d][:owner]
    group node[:p4d][:group]
    mode 0600
    recursive true
  end

  node[:p4d][:depots].each { |d|
    directory d do
      path "#{node[:p4d][:depots_dir]}/#{d}"
      owner node[:p4d][:owner]
      group node[:p4d][:group]
      mode 0600
    end

    link d do
      target_file "#{node[:p4d][:root_dir]}/#{d}"
      to "#{node[:p4d][:depots_dir]}/#{d}"
    end
  }
end

directory node[:p4d][:journal][:dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0600
  recursive true
  action :create
end if node[:p4d][:journal][:enabled]

directory node[:p4d][:log_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0600
  recursive true
  action :create
end

directory node[:p4d][:audit][:dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0600
  recursive true
  action :create
end if node[:p4d][:audit][:enabled]

remote_file 'p4d' do
  exe_file = node[:os] == "windows" ? "p4d.exe" : "p4d"
  source get_ftp_path(node[:p4d][:version], exe_file)
  path "#{node[:p4d][:install_dir]}/#{exe_file}"
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
end

template "/etc/init.d/p4d" do
  mode 0755
  source "p4d.erb"
end

service "p4d" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
