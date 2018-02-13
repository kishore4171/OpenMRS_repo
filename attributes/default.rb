if node['platform'] == 'ubuntu'
    default['OpenMRS_repo']['tomcat_servicename'] = 'tomcat7'
    default['OpenMRS_repo']['tomcat_package_list'] = ["tomcat7", "tomcat7-admin"]
    default['OpenMRS_repo']['common_package_list'] = ["openjdk-6-jdk", "mysql-server", "unzip"]

elsif node['platform'] =='redhat'
    default['OpenMRS_repo']['tomcat_servicename'] = 'tomcat'
    default['OpenMRS_repo']['tomcat_package_list'] =["tomcat7", "tomcat7-admin"]
    default['OpenMRS_repo']['common_package_list'] =["openjdk-6-jdk", "mysql-server", "unzip"]
end

default['tomcat_adminuser'] ='admin'
default['tomcat_adminpwd'] = '12345'
default['tomcat_adminroles'] = %w(tomcat admin manager manager-gui)