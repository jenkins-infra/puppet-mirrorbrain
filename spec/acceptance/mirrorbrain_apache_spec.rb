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

  context 'checks once applied' do
    before :all do
      apply_manifest 'include mirrorbrain::apache'
    end

    describe package('libapache2-mod-mirrorbrain') do
      it { is_expected.to be_installed }
    end

    describe service('apache2') do
      it { should be_running }
      it { should be_enabled }
    end
  end
end
