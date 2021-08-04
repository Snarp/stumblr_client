require 'spec_helper'

describe Tumblr::Tagged do

  let(:client) { Tumblr::Client.new }
  let(:consumer_key) { 'consumer' }
  let(:tag)          { 'helloworld' }

  before do
    Tumblr.configure do |c|
      c.consumer_key = consumer_key
    end
  end

  describe :tagged do

    before do
      expect(client).to receive(:get).once.with('v2/tagged', {
        :tag => tag,
        :api_key => consumer_key
      }).and_return('response')
    end

    it 'should setup the request properly' do
      r = client.tagged tag
      expect(r).to eq('response')
    end

  end

end
