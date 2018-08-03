node.override['mongodb']['version'] = '4.0'

case node['platform_family']
when 'debian'
  apt_repository 'mongodb' do
    uri "https://repo.mongodb.org/apt/ubuntu"
    arch 'amd64'
    distribution "#{node[:lsb][:codename]}/#{node[:mongodb][:package_name]}/#{node[:mongodb][:version]}"
    components ['multiverse']
    keyserver 'hkp://keyserver.ubuntu.com:80'
    key ['9DA31620334BD75D9DCB49F368818C72E52529D4','2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5']
    action :add
  end

when 'rhel', 'fedora'
  yum_repository 'mongodb' do
    description 'mongodb RPM Repository'
    baseurl "https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/#{node['mongodb']['version']}/#{node['kernel']['machine']  =~ /x86_64/ ? 'x86_64' : 'i686'}"
    gpgcheck false
    enabled true
    action :create
  end
end
