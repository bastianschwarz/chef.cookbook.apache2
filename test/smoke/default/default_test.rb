# frozen_string_literal: true

# Inspec test for recipe codenamephp_apache2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'apache2-1.0' do
  title 'Install Apache2'
  desc 'Install Apache2 and listen on port 80 and 443 and activate mod_ssl'

  describe service('apache2') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe apache_conf do
    its('Listen') { should eq %w[80 443] }
  end

  describe http('http://localhost') do
    its('status') { should cmp 200 }
  end
  describe http('https://localhost:443', ssl_verify: false) do
    its('status') { should cmp 200 }
  end
end
