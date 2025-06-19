require "llm_kit/version"
require "llm_kit/engine"
require "llm_kit/adapter"
require "llm_kit/client"
require "llm_kit/event_publisher"
require "llm_kit/prompt_logger"

module LlmKit
  class << self
    def adapters
      @adapters ||= {}
    end

    def register_adapter(name, adapter)
      adapters[name.to_sym] = adapter
    end

    def default_adapter=(adapter)
      register_adapter(:default, adapter)
    end
  end

  # Your code goes here...
end

# Only load models if ActiveRecord is available
if defined?(ActiveRecord)
  require "llm_kit/models/application_record"
  require "llm_kit/models/event_log"
end
