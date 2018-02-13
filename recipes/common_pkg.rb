#
# Cookbook:: OpenMRS
# Recipe:: common_pkg
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu'
 apt_update
end

node['OpenMRS_repo']['common_package_list'].each do |pkg|
package pkg do
      action :install
    end
end

include_recipe 'OpenMRS_repo::tomcat_inst_configure'  