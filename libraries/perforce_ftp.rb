#
# Cookbook Name:: perforce
# Module:: perforce_ftp
#
# Copyright 2013, Roblox Inc
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


module PerforceFtp
  def get_ftp_path(version, executable_name)
    'ftp://ftp.perforce.com/perforce/' + get_complete_p4_path(version) + "/#{executable_name}"
  end
  private
  # Returns a [String] representing the path
  # to a specific version of the p4 executable.
  #
  # @return [String]
  # @example:
  #   "r12.1/bin.linux26x86_64"
  def get_complete_p4_path(version)
    "r#{version}/#{get_p4_os_directory}"
  end


  # Returns the operating-system specific directory
  # depending on the operating system of the node.
  #
  #
  # @return [String]
  # @example:
  #   "bin.darwin90x86"
  def get_p4_os_directory
    architecture = node[:kernel][:machine] == "x86_64" ? "x86_64" : "x86"
    case node[:os]
      when "linux"
        os = "linux26#{architecture}"
      when "darwin"
        os = "darwin90#{architecture}"
      when "windows"
        architecture = node[:kernel][:machine] == "x86_64"  ? "x64" : "x86"
        os = "nt#{architecture}"
    end
    "bin.#{os}"
  end
end
