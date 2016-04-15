require 'spec_helper'

describe 'mirrorbrain::apache::debian' do
  it { should contain_class 'mirrorbrain::debian' }

  context 'apache2 related mirrorbrain packages' do
    it { should contain_package 'libapache2-mod-mirrorbrain' }
    it { should contain_package 'libapache2-mod-autoindex-mb' }
  end

  context 'apache2 packages we need as pre-requisites' do
    it { should contain_package 'libapache2-mod-geoip' }
    it { should contain_package 'libapache2-mod-form' }
    it { should contain_package 'libapache2-mod-asn' }
  end
end
