# ai_kit/lib/ai_kit/event_publisher.rb
module LlmKit
    class EventPublisher
      def self.publish(event_type:, payload:, tags: {})
        event = {
          event_type: event_type,
          payload: payload,
          tags: tags,
          timestamp: Time.now.utc.iso8601
        }
        Rails.logger.info("Publishing AI event: #{event.inspect}")
        EventBus.publish("ai_kit.events", event)
        Llm::EventLog.create!(
          kind: "async_event", payload: payload,
          tags: tags, event_type: event_type
        )
      end
    end
  end