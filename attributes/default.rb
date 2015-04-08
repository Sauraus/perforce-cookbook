#
# Cookbook Name:: perforce
# Attribute:: default
#
# Copyright 2012, Riot Games
# Copyright 2013, Roblox Inc.
#

default['perforce']['p4'].tap do |p4|
  p4['owner']           = 'root'
  p4['group']           = 'root'

  p4['bin_dir']     = '/opt/perforce'

  p4['config_filename'] = '~/.p4config'

  p4['host']           = 'localhost'
  p4['port_num']        = '1666'
  p4['port']            = "#{node['perforce']['p4']['host']}:#{node['perforce']['p4']['port_num']}"

  p4['user']            = nil
  p4['passwd']          = nil

  p4['diff']            = nil
  p4['editor']          = nil
  p4['merge']           = nil

  p4['client']          = nil

  p4['charset']         = nil
  p4['commandcharset']  = nil
  p4['language']        = nil

  p4['version'] = '14.2'
end
