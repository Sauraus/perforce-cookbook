user node[:p4d][:owner] do
  system true
  action :create
end

group node[:p4d][:group] do
  action :create
end

directory node[:p4d][:install_dir] do
  recursive true
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
end

directory node[:p4d][:root_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
  recursive true
end

directory node[:p4d][:journal][:dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
  recursive true
  action :create
end if node[:p4d][:journal][:enabled]

directory node[:p4d][:log_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
  recursive true
  action :create
end

directory node[:p4d][:audit][:dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  mode 0700
  recursive true
  action :create
end if node[:p4d][:audit][:enabled]

perforce_p4d node[:p4d][:version] do
  directory node[:p4d][:install_dir]
  sixty_four node[:kernel][:machine] == "x86_64"
end

template "/etc/init.d/p4d" do
  mode 0755
  source "p4d.erb"
end

service "p4d" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

execute "start-p4d" do
  command "service p4d start"
end