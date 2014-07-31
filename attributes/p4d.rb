#
# Cookbook Name:: perforce
# Attribute:: p4d
#
# Copyright 2013, Roblox Inc.
#

default['perforce']['p4d'].tap do |p4d|
  p4d['owner']           = 'perforce'
  p4d['group']           = 'perforce'

  p4d['bin_dir']     = '/opt/perforce'

  p4d['journal'].tap do |journal|
    journal['enabled'] = true
    journal['dir']     = '/var/perforce'
    journal['file']     = 'journal'
  end

  p4d['log_dir']     = '/var/log/perforce'
  p4d['log_file']     = 'log'

  p4d['audit'].tap do |audit|
    audit['enabled'] = false
    audit['dir']     = '/var/log/perforce'
    audit['file']     = 'audit'
  end

  p4d['root_dir']     = '/var/perforce/root'
  p4d['depots_dir']     = '/var/perforce/depot'
  p4d['depots']    = ['depot']
  p4d['port']     = 1666
  p4d['auth_server'] = nil

  p4d['version'] = '14.1'
  p4d['checksum'] = 'f8e708d47792c0bfaa9fdced23b4a4bb1e013a2b5ba35ace6ca838985f4264b9'

  p4d['pidfile'] = '/var/run/p4d.pid'
end
