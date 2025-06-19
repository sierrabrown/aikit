# ai_kit/lib/ai_kit/prompt_logger.rb
module LlmKit
    class PromptLogger
      def self.log(kind:, prompt:, response:, tokens:, latency:, tags:, model:)
        LlmKit::EventLog.create!(
          kind: kind, prompt: prompt, response: response,
          tokens: tokens, latency: latency, tags: tags, model: model
        )
      end
    end
  end