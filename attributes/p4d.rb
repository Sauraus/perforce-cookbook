#
# Cookbook Name:: perforce
# Attribute:: p4d
#
# Copyright 2013, Roblox Inc.
#

default['perforce']['p4d'].tap do |p4d|
  p4d['owner'] = 'perforce'
  p4d['group']  = 'perforce'

  p4d['bin_dir']  = '/opt/perforce'

  p4d['journal'].tap do |journal|
    journal['enabled'] = true
    journal['dir']  = '/var/perforce'
    journal['file']  = 'journal'
  end

  p4d['log_dir'] = '/var/log/perforce'
  p4d['log_file'] = 'log'

  p4d['audit'].tap do |audit|
    audit['enabled'] = false
    audit['dir']   = '/var/log/perforce'
    audit['file'] = 'audit'
  end

  p4d['root_dir'] = '/var/perforce/root'
  p4d['depots_dir'] = '/var/perforce/root/depot'
  p4d['depots'] = ['depot']
  p4d['port'] = 1666
  p4d['auth_server'] = nil

  p4d['version'] = '15.1'

  p4d['name'] = nil
  p4d['pidfile'] = '/var/run/p4d.pid'

  p4d['ftp_path'] = nil
end
