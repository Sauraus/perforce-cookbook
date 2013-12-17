#
# Cookbook Name:: perforce
# Attributes:: default
#
# Copyright 2013, Roblox Inc
# Copyright 2012, Riot Games
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:p4][:owner]           = 'root'
default[:p4][:group]           = 'root'

default[:p4][:install_dir]     = '/opt/perforce'

default[:p4][:config_filename] = '.p4config'

default[:p4][:host]            = 'localhost'
default[:p4][:port_num]        = '1666'
default[:p4][:port]            = "#{node[:p4][:host]}:#{node[:p4][:port_num]}"

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
