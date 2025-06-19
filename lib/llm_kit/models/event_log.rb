# engines/llm_kit/app/models/llm_kit/event_log.rb
module LlmKit
    class EventLog < ApplicationRecord
      self.table_name = "llm_kit_event_logs"
    end
  end
