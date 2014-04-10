#
# Cookbook Name:: perforce
# Recipe:: macosx
#
# Copyright 2012, Riot Games
#

include_recipe 'homebrew'

package 'perforce'

p4 = node['perforce']['p4']
user_data = node[:etc]['passwd'][p4['owner']]
home_dir_path = user_data['dir']
p4config_path = File.join home_dir_path, p4['config_filename']
shellrc_path = File.join home_dir_path, case user_data[:shell]
                                        when '/bin/bash'
                                          '.bash_profile'
                                        when '/bin/zsh'
                                          '.zshrc'
                                        end

set_p4config_line = "p4 set P4CONFIG=\"#{p4config_path}\""

template p4config_path do
  owner     node['owner']
  group     node['group']
  variables p4
end

ruby_block 'set P4CONFIG in shell rc file' do
  block do
    content = nil
    File.open(shellrc_path, 'r') do |file|
      content = file.read

      p4config_matcher = 'P4CONFIG=\"[^\"]*\"'
      content.gsub! /^.*#{p4config_matcher}.*$/, set_p4config_line

      content << "\n\n#{set_p4config_line}" unless content =~ /#{p4config_matcher}/
    end

    File.open(shellrc_path, 'w') do |f|
      f.print(content)
    end

  end

  not_if do
    begin
      File.open(shellrc_path) do |file|
        !!(file.readlines.join("\n") =~ /#{set_p4config_line}/)
      end
    rescue Errno::ENOENT
      false
    end
  end
end
