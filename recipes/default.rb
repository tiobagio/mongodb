#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


include_recipe "mongodb::mongodb_repo"

package "mongodb-org"

template "/etc/mongod.conf" do
  source "mongod.conf.erb"
  owner "mongodb"
  group "mongodb"
  mode '0600'
end

service "mongod" do
 action [:enable, :restart]
  ignore_failure true
end
