require 'puppetlabs_spec_helper/module_spec_helper'

ENV['FUTURE_PARSER'] = 'yes'
ENV['STRICT_VARIABLES'] = 'yes'

FIXTURES_PATH = File.expand_path(File.dirname(__FILE__) + '/fixtures')
# Set up our $LOAD_PATH to properly include custom provider code from modules
# in spec/fixtures
$LOAD_PATH.unshift(*Dir["#{FIXTURES_PATH}/modules/*/lib"])


RSpec.configure do |r|
  r.default_facts = {
    :osfamily => 'Debian',
    :lsbdistrelease => '14.04',
    :operatingsystem => 'Ubuntu',
    :operatingsystemrelease => '14.04',
  }
end
