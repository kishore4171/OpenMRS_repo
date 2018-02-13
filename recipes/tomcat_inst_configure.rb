#
# Cookbook:: OpenMRS
# Recipe:: tomcat_inst_configure
#
# Copyright:: 2018, The Authors, All Rights Reserved.


node['OpenMRS_repo']['tomcat_package_list'].each do |tkt|
package tkt do
      action :install
      notifies :enable, 'service[tomcat_service]', :immediately
      notifies :restart, 'service[tomcat_service]', :immediately
    end
end

template '/etc/tomcat7/tomcat-users.xml' do
  source 'tomcat_users.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  variables(admin_user: node['tomcat_adminuser'],
  admin_pwd: node['tomcat_adminpwd'],
  admin_role1: "tomcat",
  admin_role2: "admin",
  admin_role3: "manager",
  admin_role4: "manager-gui")
end

directory '/usr/share/tomcat7/.OpenMRS/' do
  owner 'tomcat7'
  group 'tomcat7'
  mode '0755'
  action :create
end

service 'tomcat_service' do
  service_name node['OpenMRS_repo']['tomcat_servicename']
  action :nothing
end

include_recipe 'OpenMRS_repo::openmrs_app'