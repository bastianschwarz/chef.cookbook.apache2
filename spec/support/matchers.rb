if defined?(ChefSpec)
  def enable_site(site_name)
    ChefSpec::Matchers::ResourceMatcher.new(:execute, :run, "a2ensite #{site_name}.conf")
  end
end
