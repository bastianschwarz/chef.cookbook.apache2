#
# Cookbook:: codenamephp_apache2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2'

apache_site 'default-ssl' if node['apache']['default_site_enabled'] == true
