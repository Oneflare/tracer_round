require 'spec_helper'

describe TracerRound::Logger do
  let(:user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36' }
  let(:logger) { TracerRound::Logger.new('login', 1, '216.58.220.132', user_agent) }
  before(:each) { TracerRound.config.maxmind_database_path = File.expand_path('../../../data/GeoLite2-Country.mmdb', __FILE__) }

  describe '#log' do
  end

  describe '#params' do
  end

  describe '#browser' do
    it 'should return a browser object' do
      expect(logger.browser.class).to eq(Browser::Chrome)
    end
  end

  describe '#origin_country' do
    it 'should return the correct country' do
      expect(logger.origin_country).to eq('United States')
    end
  end

  describe '#origin_device' do
  end

  describe '#origin_browser' do
  end
end
