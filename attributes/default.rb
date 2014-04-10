#
# Cookbook Name:: perforce
# Attribute:: default
#
# Copyright 2012, Riot Games
# Copyright 2013, Roblox Inc.
#

default[:perforce][:p4][:owner]           = 'root'
default[:perforce][:p4][:group]           = 'root'

default[:perforce][:p4][:install_dir]     = '/opt/perforce'

default[:perforce][:p4][:config_filename] = '.p4config'

default[:perforce][:p4][:host]            = 'localhost'
default[:perforce][:p4][:port_num]        = '1666'
default[:perforce][:p4][:port]            = "#{node[:perforce][:p4][:host]}:#{node[:perforce][:p4][:port_num]}"

default[:perforce][:p4][:user]            = node[:perforce][:p4][:owner]
default[:perforce][:p4][:passwd]          = nil

default[:perforce][:p4][:diff]            = nil
default[:perforce][:p4][:editor]          = nil
default[:perforce][:p4][:merge]           = nil

default[:perforce][:p4][:client]          = nil

default[:perforce][:p4][:charset]         = nil
default[:perforce][:p4][:commandcharset]  = nil
default[:perforce][:p4][:language]        = nil

default[:perforce][:p4][:version] = '14.1'
