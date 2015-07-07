#
# Cookbook Name:: perforce
# Recipe:: windows
#
# Copyright 2015, Antek S. Baranski
#

directory node['perforce']['p4']['bin_dir'] do
  recursive true
end

exe_file = "p4.exe"
ftp_path =  get_ftp_path(node['perforce']['p4']['ftp_path'], node['perforce']['p4']['version'], exe_file)

remote_file 'p4' do
  source ftp_path
  path "#{node['perforce']['p4']['bin_dir']}/#{exe_file}"
  owner node['perforce']['p4']['owner']
  group node['perforce']['p4']['group']
  mode 0755
end

windows_path node['perforce']['p4']['bin_dir'] do
  action :add
end
