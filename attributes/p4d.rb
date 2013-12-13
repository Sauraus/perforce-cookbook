#
# Cookbook Name:: perforce
# Attribute:: p4d
#
# Copyright 2013, Roblox Inc.
#

default[:p4d][:owner]           = 'perforce'
default[:p4d][:group]           = 'perforce'

default[:p4d][:install_dir]     = '/opt/perforce'

default[:p4d][:journal][:enabled] = true
default[:p4d][:journal][:dir]     = '/var/perforce'
default[:p4d][:journal][:file]     = 'journal'

default[:p4d][:log_dir]     = '/var/log/perforce'
default[:p4d][:log_file]     = 'log'

default[:p4d][:audit][:enabled] = true
default[:p4d][:audit][:dir]     = '/var/log/perforce'
default[:p4d][:audit][:file]     = 'audit'

default[:p4d][:root_dir]     = '/var/perforce/root'
default[:p4d][:depots_dir]     = '/var/perforce/depot'
default[:p4d][:depots]     = ['depot']
default[:p4d][:port]     = 1666

default[:p4d][:version] = '13.3'

default[:p4d][:pidfile] = '/var/run/p4d.pid'
