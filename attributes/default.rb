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

default[:p4][:install_dir]     = '/perforce'

default[:p4][:config_filename] = '.p4config'

default[:p4][:port]            = nil

default[:p4][:user]            = default[:p4][:owner]
default[:p4][:passwd]          = nil

default[:p4][:diff]            = nil
default[:p4][:editor]          = nil
default[:p4][:merge]           = nil

default[:p4][:client]          = nil

default[:p4][:charset]         = 'utf8'
default[:p4][:commandcharset]  = nil
default[:p4][:language]        = nil 
default[:p4][:host]            = nil

