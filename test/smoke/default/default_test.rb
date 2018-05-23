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
    its('Listen') { should eq ['*:443', '*:80'] }
  end

  # test is executed locally, so inspec calls the host machine, mapped to port 80 on the guest in kitchen
  describe http('http://localhost') do
    its('status') { should cmp 200 }
  end
  # test is executed locally, so inspec calls the host machine, mapped to port 443 on the guest in kitchen
  describe http('https://localhost', ssl_verify: false) do
    its('status') { should cmp 200 }
  end
end
