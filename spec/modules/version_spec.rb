require 'spec_helper'

describe TracerRound do
  describe '#version' do
    it { expect(subject::VERSION).to eq('0.0.1') }
  end
end
