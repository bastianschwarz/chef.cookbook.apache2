name 'chef.cookbook.apache2'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'Cookbook to install apache2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.apache2/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.apache2' if respond_to?(:source_url)

supports 'debian', '~>9.1'

depends 'apt'
depends 'apache2', '~> 5.0.1'