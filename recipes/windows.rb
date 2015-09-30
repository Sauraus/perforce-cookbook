#
# Cookbook Name:: perforce
# Recipe:: windows
#
# Copyright 2015, Antek S. Baranski
#

directory node['perforce']['p4']['bin_dir'] do
  recursive true
end

exe_file = 'p4.exe'
ftp_path =  get_ftp_path(node['perforce']['p4']['ftp_path'], node['perforce']['p4']['version'], exe_file)

remote_file 'p4.exe' do
  source ftp_path
  path ::File.join(node['perforce']['p4']['bin_dir'], exe_file)
  rights :read_execute, 'Everyone'
  rights :full_control, 'Administrators'
  mode 00755
end

windows_path node['perforce']['p4']['bin_dir'] do
  action :add
end
