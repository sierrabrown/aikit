# engines/llm_kit/db/migrate/20240619120000_create_event_logs.rb
class CreateEventLogs < ActiveRecord::Migration[7.0]
    def change
      create_table :llm_kit_event_logs do |t|
        t.string :kind
        t.text :prompt
        t.text :response
        t.jsonb :payload
        t.jsonb :tags, default: {}
        t.string :event_type
        t.string :model
        t.float :latency
        t.integer :tokens
        t.timestamps
      end
    end
  end