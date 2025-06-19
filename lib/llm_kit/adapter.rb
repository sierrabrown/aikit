module LlmKit
  class Adapter
    def chat(prompt:, **opts)
      raise NotImplementedError, "Adapters must implement #chat"
    end

    def stream_chat(prompt:, **opts, &block)
      raise NotImplementedError, "Adapters must implement #stream_chat"
    end

    protected

    def format_response(text:, tokens: nil, metadata: {})
      {
        text: text,
        tokens: tokens,
        metadata: metadata
      }
    end
  end
end