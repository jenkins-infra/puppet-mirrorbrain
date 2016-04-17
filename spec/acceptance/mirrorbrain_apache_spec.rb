require 'spec_helper_acceptance'

describe 'mirrorbrain::apache class' do
  let(:manifest) do
    'include mirrorbrain::apache'
  end

  it 'should apply the manifest cleanly' do
    apply_manifest(manifest, :expect_changes=> true)

    # run a second time without changes
    apply_manifest(manifest, :catch_changes => true)
  end

  describe package('libapache2-mod-mirrorbrain') do
    before :each do
      apply_manifest manifest
    end

    it { is_expected.to be_installed }
  end
end
