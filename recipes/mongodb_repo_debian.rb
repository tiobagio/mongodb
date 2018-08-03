## Note: this recipe is experimental
## use mongodb_repo instead, which uses apt_repository resource
##
node.override['mongodb']['package_name'] = 'mongodb-org'


case node['platform_family']
when 'debian'
  # for mongodb-org-4.0
  execute 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4'

  file "/etc/apt/sources.list.d/mongodb-org-#{node[:mongodb][:version]}.list" do
    content "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu #{node[:lsb][:codename]}/mongodb-org/#{node[:mongodb][:version]} multiverse\n"
  end
  execute "apt-get update"
  #apt_update
end
