require 'spec_helper'

describe 'mirrorbrain::apache' do
  it { should contain_class('mirrorbrain::apache') }
  it { should contain_class 'apache' }

  it { should contain_class 'mirrorbrain::apache::debian' }

  it { should contain_class 'apache::mod::event' }

  context 'enable Apache modules' do
    it { should contain_apache__mod 'mod_asn' }
    it { should contain_apache__mod 'mod_dbd' }
    it { should contain_apache__mod 'mod_form' }
    it { should contain_apache__mod 'mod_geoip' }
    it { should contain_apache__mod 'mod_mirrorbrain' }
    it { should contain_apache__mod 'mod_autoindex_mb' }
  end
end
