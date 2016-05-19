require 'spec_helper'

describe TracerRound do
  describe 'configuring' do
    describe '#maxmind_database' do
      let(:path) { 'somepath/GeoLite2-Country.mmdb' }

      before(:each) do
        subject.configure do |config|
          config.maxmind_database_path = path
        end
      end

      it 'should return the intended maxmind path' do
        expect(subject.config.maxmind_database_path).to eq(path)
      end
    end
  end
end
