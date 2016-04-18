require 'spec_helper'

describe 'mirrorbrain::apache' do
  it { should contain_class('mirrorbrain::apache') }
  it { should contain_class 'apache' }

  it { should contain_class 'mirrorbrain::apache::debian' }

  it { should contain_class 'apache::mod::event' }

  context 'enable Apache modules' do
    it { should contain_apache__mod 'dbd' }
    it { should contain_apache__mod 'form' }
    it { should contain_apache__mod 'geoip' }
    it { should contain_apache__mod 'mirrorbrain' }
    it { should contain_apache__mod 'autoindex_mb' }
  end
end
