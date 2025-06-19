require 'spec_helper'
require 'llm_kit'

describe LlmKit do
  let(:test_adapter) { double("TestAdapter") }

  before do
    # Clear any registered adapters before each test
    LlmKit.instance_variable_set(:@adapters, nil)
  end

  it 'loads the LlmKit module' do
    expect(defined?(LlmKit)).to eq('constant')
  end

  it 'has a version number' do
    expect(LlmKit::VERSION).not_to be_nil
  end

  describe '.adapters' do
    it 'returns an empty hash when no adapters are registered' do
      expect(LlmKit.adapters).to eq({})
    end

    it 'maintains registered adapters' do
      LlmKit.register_adapter(:test, test_adapter)
      expect(LlmKit.adapters[:test]).to eq(test_adapter)
    end
  end

  describe '.register_adapter' do
    it 'registers an adapter with a symbol key' do
      LlmKit.register_adapter('test', test_adapter)
      expect(LlmKit.adapters[:test]).to eq(test_adapter)
    end

    it 'overwrites existing adapters with the same name' do
      other_adapter = double("OtherAdapter")
      LlmKit.register_adapter(:test, test_adapter)
      LlmKit.register_adapter(:test, other_adapter)
      expect(LlmKit.adapters[:test]).to eq(other_adapter)
    end
  end

  describe '.default_adapter=' do
    it 'sets the default adapter' do
      LlmKit.default_adapter = test_adapter
      expect(LlmKit.adapters[:default]).to eq(test_adapter)
    end
  end
end