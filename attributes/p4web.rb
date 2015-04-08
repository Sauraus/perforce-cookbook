#
# Cookbook Name:: perforce
# Attribute:: p4web
#
# Copyright 2014, Antek Baranski
#

include_attribute 'perforce::default'

default['perforce']['p4web'].tap do |p4web|
  p4web['owner'] = 'perforce'
  p4web['group'] = 'perforce'

  p4web['bin_dir'] = '/opt/perforce'

  p4web['version'] = '12.1'

  p4web['pidfile'] = '/var/run/p4web.pid'

  p4web['mode'] = 'viewer' # or standard
  p4web['port'] = nil
  p4web['options'] = nil
end

default['perforce']['p4']['host'] = node['fqdn']
