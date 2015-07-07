#
# Cookbook Name:: perforce
# Attribute:: default
#
# Copyright 2012, Riot Games
# Copyright 2013, Roblox Inc.
#

default['perforce']['p4'].tap do |p4|
  p4['owner'] = 'root'
  p4['group'] = 0

  case node[:os]
    when "linux"
      p4['bin_dir']  = '/opt/perforce'
    when "windows"
      p4['bin_dir'] = 'C:\Program Files (x86)\Perforce'
  end

  p4['config_filename'] = '~/.p4config'

  p4['host'] = 'localhost'
  p4['port_num']  = '1666'
  p4['port']  = "#{node['perforce']['p4']['host']}:#{node['perforce']['p4']['port_num']}"

  p4['user']  = nil
  p4['passwd'] = nil

  p4['diff'] = nil
  p4['editor'] = nil
  p4['merge'] = nil

  p4['client'] = nil

  p4['charset'] = nil
  p4['commandcharset'] = nil
  p4['language'] = nil

  p4['version'] = '15.1'

  p4['ftp_path'] = nil
end
