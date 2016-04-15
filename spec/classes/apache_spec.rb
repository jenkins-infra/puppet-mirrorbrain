require 'spec_helper'

describe 'mirrorbrain::apache' do
  it { should contain_class('mirrorbrain::apache') }
  it { should contain_class 'apache' }

  it { should contain_class 'mirrorbrain::apache::debian' }

  it { should contain_class 'apache::mod::event' }

  it { should contain_apache__mod 'mod_geoip' }
end
