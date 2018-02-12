#
# Cookbook:: OpenMRS
# Recipe:: openmrs_app
#
# Copyright:: 2018, The Authors, All Rights Reserved.

remote_file '/var/lib/tomcat7/webapps/openmrs.war' do
  source 'http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_1.9.3/openmrs.war/download'
  owner 'tomcat7'
  group 'tomcat7'
  mode '0755'
  action :create
end

service 'tomcat7' do
  action :restart
end
