# frozen_string_literal: true

#
# Cookbook:: codenamephp_apache2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# service['apache2'] is defined in the apache2_default_install resource but other resources are currently unable to reference it.
# To work around this issue, define the following helper in your cookbook:
service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name } # rubocop:disable Lint/AmbiguousBlockAssociation
  supports restart: true, status: true, reload: true
  action :nothing
end

apache2_install 'default_install'
apache2_module 'headers'
apache2_module 'deflate'
apache2_module 'env'
apache2_module 'filter'
apache2_module 'macro'
apache2_module 'remoteip'
apache2_module 'rewrite'
apache2_module 'ssl'

# Create site template with our custom config
site_name = 'default_ssl'

template site_name do
  extend Apache2::Cookbook::Helpers
  source 'default_ssl.conf.erb'
  path "#{apache_dir}/sites-available/#{site_name}.conf"
end

apache2_site site_name
