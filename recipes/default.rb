#
# Cookbook Name:: perforce
# Recipe:: default
#
# Author:: Josiah Kiehl <josiah@bluepojo.com>
# Author:: Kyle Allan <kallan@riotgames.com>
#
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#
case node[:os]
when "linux"
  include_recipe "perforce::linux"
when "darwin"
  include_recipe "perforce::macosx"
end