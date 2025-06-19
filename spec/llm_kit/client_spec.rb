require 'spec_helper'
require 'llm_kit/client'
require 'llm_kit/adapter'

describe LlmKit::Client do
  class TestAdapter < LlmKit::Adapter
    def initialize(response_text: "Hello!", tokens: 3)
      @response_text = response_text
      @tokens = tokens
    end

    def chat(prompt:, **opts)
      format_response(
        text: @response_text,
        tokens: @tokens,
        metadata: { prompt: prompt }
      )
    end
  end

  let(:prompt) { "Say hello" }
  let(:model) { :default }
  let(:tags) { { user: "test" } }
  let(:test_adapter) { TestAdapter.new }

  before do
    # Reset adapters before each test
    LlmKit.instance_variable_set(:@adapters, nil)
    # Register test adapter as default
    LlmKit.default_adapter = test_adapter
    # Stub PromptLogger to avoid database dependency
    stub_const("LlmKit::PromptLogger", Class.new do
      def self.log(**args); end
    end)
  end

  describe ".call" do
    it "returns the adapter's chat text" do
      result = described_class.call(prompt: prompt, model: model, tags: tags)
      expect(result).to eq("Hello!")
    end

    it "logs the prompt and response" do
      expect(LlmKit::PromptLogger).to receive(:log).with(hash_including(prompt: prompt, response: "Hello!", model: model, tags: tags))
      described_class.call(prompt: prompt, model: model, tags: tags)
    end
  end

  describe ".emit_async_event" do
    it "publishes an event" do
      expect(LlmKit::EventPublisher).to receive(:publish).with(event_type: :foo, payload: { bar: 1 }, tags: tags)
      described_class.emit_async_event(event_type: :foo, payload: { bar: 1 }, tags: tags)
    end
  end
end