#
# Cookbook Name:: perforce
# Attribute:: p4d
#
# Copyright 2013, Roblox Inc.
#

default[:perforce][:p4d][:owner]           = 'perforce'
default[:perforce][:p4d][:group]           = 'perforce'

default[:perforce][:p4d][:install_dir]     = '/opt/perforce'

default[:perforce][:p4d][:journal][:enabled] = true
default[:perforce][:p4d][:journal][:dir]     = '/var/perforce'
default[:perforce][:p4d][:journal][:file]     = 'journal'

default[:perforce][:p4d][:log_dir]     = '/var/log/perforce'
default[:perforce][:p4d][:log_file]     = 'log'

default[:perforce][:p4d][:audit][:enabled] = false
default[:perforce][:p4d][:audit][:dir]     = '/var/log/perforce'
default[:perforce][:p4d][:audit][:file]     = 'audit'

default[:perforce][:p4d][:root_dir]     = '/var/perforce/root'
default[:perforce][:p4d][:depots_dir]     = '/var/perforce/depot'
default[:perforce][:p4d][:depots]     = ['depot']
default[:perforce][:p4d][:port]     = 1666

default[:perforce][:p4d][:version] = '14.1'

default[:perforce][:p4d][:pidfile] = '/var/run/p4d.pid'
