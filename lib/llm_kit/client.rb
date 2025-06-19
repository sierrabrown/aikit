# ai_kit/lib/ai_kit/client.rb
module LlmKit
    class Client
      def self.call(prompt:, model: :default, tags: {}, **opts)
        adapter = LlmKit.adapters[model] || LlmKit.adapters[:default]
        start = Time.now
        result = adapter.chat(prompt: prompt, **opts)
        latency = Time.now - start
        LlmKit::PromptLogger.log(
          kind: "model_sync", prompt: prompt, response: result[:text],
          tokens: result[:tokens], latency: latency, tags: tags, model: model
        )
        result[:text]
      end

      def self.emit_async_event(event_type:, payload:, tags: {})
        LlmKit::EventPublisher.publish(
          event_type: event_type, payload: payload, tags: tags
        )
      end
    end
end
