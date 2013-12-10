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
end

directory node[:p4d][:root_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  recursive true
end

directory node[:p4d][:journal_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  recursive true
  action :create
end

directory node[:p4d][:log_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  recursive true
  action :create
end

directory node[:p4d][:audit_dir] do
  owner node[:p4d][:owner]
  group node[:p4d][:group]
  recursive true
  action :create
end

perforce_p4d node[:p4d][:version] do
  directory node[:p4d][:install_dir]
  sixty_four node[:kernel][:machine] == "x86_64"
end

template "/etc/init.d/p4d" do
  mode 0755
  source "p4d.erb"
  variables(:user => node[:p4d][:owner],
            :install_dir => node[:p4d][:install_dir],
            :root => node[:p4d][:root_dir],
            :journal => node[:p4d][:journal_dir],
            :log => node[:p4d][:log_dir],
            :port => node[:p4d][:port]
  )
end

service "p4d" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

execute "start-p4d" do
  command "/etc/init.d/p4d start"
end