#
# Cookbook:: OpenMRS
# Recipe:: tomcat_inst_configure
#
# Copyright:: 2018, The Authors, All Rights Reserved.


node['OpenMRS']['tomcat_package_list'].each do |tkt|
package tkt do
      action :install
      notifies :enable, 'service[tomcat_service]', :immediately
      notifies :restart, 'service[tomcat_service]', :immediately
    end
end
cookbook_file '/etc/tomcat7/tomcat-users.xml' do
  source 'tomcat-users.xml'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
execute 'OpenMRS_dir' do
  command 'sudo mkdir /usr/share/tomcat7/.OpenMRS'
  action :run
end
execute 'chg_ownership' do
  command 'sudo chown -R tomcat7:tomcat7 /usr/share/tomcat7/.OpenMRS/'
  action :run
end
service 'tomcat_service' do
  service_name node['OpenMRS']['tomcat_servicename']
  action :nothing
end

include_recipe 'OpenMRS::openmrs_app'