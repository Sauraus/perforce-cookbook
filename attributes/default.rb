#
# Cookbook Name:: perforce
# Attribute:: default
#
# Author:: Josiah Kiehl <josiah@bluepojo.com>
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#

default[:p4][:owner]           = node[:current_user]
default[:p4][:group]           = nil
default[:p4d][:owner]           = 'perforce'
default[:p4d][:group]           = 'p4admin'

default[:p4][:install_dir]     = '/opt/perforce'
default[:p4d][:install_dir]     = '/opt/perforce'
default[:p4d][:journal_dir]     = '/var/perforce/journal'
default[:p4d][:log_dir]     = '/var/perforce/log'
default[:p4d][:root_dir]     = '/var/perforce'
default[:p4d][:port]     = 1666

default[:p4][:config_filename] = '.p4config'

default[:p4][:port]            = 'localhost:' + default[:p4d][:port].to_s

default[:p4][:user]            = default[:p4][:owner]
default[:p4][:passwd]          = nil

default[:p4][:diff]            = nil
default[:p4][:editor]          = nil
default[:p4][:merge]           = nil

default[:p4][:client]          = nil

default[:p4][:charset]         = nil
default[:p4][:commandcharset]  = nil
default[:p4][:language]        = nil 
default[:p4][:host]            = nil

default[:p4][:version] = '13.3'
default[:p4d][:version] = default[:p4][:version]