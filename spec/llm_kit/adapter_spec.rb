require 'spec_helper'
require 'llm_kit/adapter'

describe LlmKit::Adapter do
  let(:adapter) { described_class.new }

  describe "#chat" do
    it "raises NotImplementedError" do
      expect { adapter.chat(prompt: "Hello") }.to raise_error(NotImplementedError)
    end
  end

  describe "#stream_chat" do
    it "raises NotImplementedError" do
      expect { adapter.stream_chat(prompt: "Hello") }.to raise_error(NotImplementedError)
    end
  end

  describe "#format_response" do
    it "formats the response with the required fields" do
      response = adapter.send(:format_response, text: "Hello", tokens: 5, metadata: { model: "test" })
      expect(response).to eq({
        text: "Hello",
        tokens: 5,
        metadata: { model: "test" }
      })
    end

    it "handles missing optional fields" do
      response = adapter.send(:format_response, text: "Hello")
      expect(response).to eq({
        text: "Hello",
        tokens: nil,
        metadata: {}
      })
    end
  end
end