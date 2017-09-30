# # encoding: utf-8

# Inspec test for recipe chef.cookbook.apache2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control "apache2-1.0" do
  title "Install Apache2"
  desc "Install Apache2 and listen on port 80 and 443 and activate mod_ssl"

  describe service('apache2') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe apache_conf do
    its('Listen') { should eq ["*:443", "*:80"]}
  end

  describe http('http://localhost:8080') do #test is executed locally, so inspec calls the host machine, mapped to port 80 on the guest in kitchen
    its('status') { should cmp 200 }
  end
  describe http('https://localhost:8443', ssl_verify: false) do #test is executed locally, so inspec calls the host machine, mapped to port 443 on the guest in kitchen
    its('status') { should cmp 200 }
  end
end

