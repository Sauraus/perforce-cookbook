#
# Cookbook Name:: perforce
# Recipe:: linux
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

user node[:p4][:owner] do
  system true
  action :create
end

directory node[:p4][:install_dir] do
  recursive true
end

remote_file 'p4' do
  exe_file = node[:os] == "windows" ? "p4.exe" : "p4"
  source get_ftp_path(node[:p4][:version], exe_file)
  path "#{node[:p4][:install_dir]}/#{exe_file}"
  owner node[:p4][:owner]
  group node[:p4][:group]
  mode 0755
end

template "/etc/profile.d/perforce.sh" do
  owner 'root'
  group 'root'
  mode 0755
  source "perforce.sh.erb"
end
