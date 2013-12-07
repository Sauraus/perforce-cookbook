def load_current_resource
    @current_resource = Chef::Resource::PerforceP4.new(new_resource.name)
    @current_resource.directory new_resource.directory
end

action :install do
  downloadable = node[:os] == "windows" ? "p4d.exe" : "p4d"
  path_to_p4d_executable = ::File.join(new_resource.directory, downloadable)
  unless ::File.exists?(::File.join(@current_resource.directory, downloadable))
    p4_ftp.chdir("perforce/#{get_complete_p4_path}")

    p4_ftp.getbinaryfile(downloadable, path_to_p4d_executable)
    p4_ftp.close

	file "#{path_to_p4d_executable}" do
	  owner node[:p4d][:owner]
	  group node[:p4d][:group]
	  mode "0700"
	  action :create
	end	
  end
end

private

# Creates and returns the instance variable @ftp.
# 
# @return [Net::FTP] an FTP connection to Perforce
def p4_ftp
  require 'net/ftp'
  return @ftp if @ftp
  @ftp = Net::FTP.new('ftp.perforce.com', 'anonymous')
end


# Returns a [String] representing the path
# to a specific version of the p4 executable.
# 
# @return [String]
# @example:
#   "r12.1/bin.linux26x86_64"
def get_complete_p4_path
  "r#{new_resource.version}/#{get_p4_os_directory}"
end


# Returns the operating-system specific directory
# depending on the operating system of the node.
# 
# 
# @return [String]
# @example:
#   "bin.darwin90x86"
def get_p4_os_directory
  architecture = new_resource.sixty_four ? "x86_64" : "x86"
  case node[:os]
  when "linux"
    os = "linux26#{architecture}"
  when "darwin"
    os = "darwin90#{architecture}"
  when "windows"
    architecture = new_resource.sixty_four ? "x64" : "x86"
    os = "nt#{architecture}"
  end
  "bin.#{os}"
end