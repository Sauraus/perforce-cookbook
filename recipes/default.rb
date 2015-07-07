#
# Cookbook Name:: perforce
# Recipe:: default
#
# Copyright 2012, Riot Games
#

case node[:os]
when "linux"
  include_recipe "perforce::linux"
when "darwin"
  include_recipe "perforce::macosx"
when "windows"
  include_recipe "perforce::windows"
else
  log "Unsupported OS #{node[:os]}"
end
