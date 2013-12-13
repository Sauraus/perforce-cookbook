#
# Cookbook Name:: perforce
# Attribute:: default
#
# Copyright 2012, Riot Games
# Copyright 2013, Roblox Inc.
#

default[:p4][:owner]           = 'perforce'
default[:p4][:group]           = 'perforce'

default[:p4][:install_dir]     = '/opt/perforce'

default[:p4][:config_filename] = '.p4config'

default[:p4][:host]            = 'localhost'
default[:p4][:port_num]        = '1666'
default[:p4][:port]            = node[:p4][:host] + ':' + node[:p4][:port_num]

default[:p4][:user]            = node[:p4][:owner]
default[:p4][:passwd]          = nil

default[:p4][:diff]            = nil
default[:p4][:editor]          = nil
default[:p4][:merge]           = nil

default[:p4][:client]          = nil

default[:p4][:charset]         = nil
default[:p4][:commandcharset]  = nil
default[:p4][:language]        = nil

default[:p4][:version] = '13.3'
