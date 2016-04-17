require 'beaker-rspec'

# Install Puppet on all hosts
hosts.each do |host|
  install_puppet_on host, :default_action => 'gem_install'
end

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    # Install module to all hosts
    hosts.each do |host|
      install_dev_puppet_module_on(host,
        :source => module_root,
        :module_name => 'mirrorbrain',
        :target_module_path => '/etc/puppet/modules')

      # Install dependencies
      ['puppetlabs-stdlib',
       'puppetlabs-apt',
       'puppetlabs-apache',
      ].each do |dependency|
        on(host, puppet('module', 'install', dependency))
      end
    end
  end
end
