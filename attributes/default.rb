if node['platform'] == 'ubuntu'
    default['OpenMRS']['tomcat_servicename'] = 'tomcat7'
    default['OpenMRS']['tomcat_package_list'] = ["tomcat7", "tomcat7-admin"]
    default['OpenMRS']['common_package_list'] = ["openjdk-6-jdk", "mysql-server", "unzip"]

elsif node['platform'] =='redhat'
    default['OpenMRS']['tomcat_servicename'] = 'tomcat'
    default['OpenMRS']['tomcat_package_list'] =["tomcat7", "tomcat7-admin"]
    default['OpenMRS']['common_package_list'] =["openjdk-6-jdk", "mysql-server", "unzip"]
end