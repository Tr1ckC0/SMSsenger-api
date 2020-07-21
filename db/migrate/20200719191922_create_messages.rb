class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message_uuid
      t.string :to
      t.string :from
      t.string :text
      t.boolean :received, :default => false 
      # t.string :message_time
      # t.string :sent_time


      t.timestamps
    end
  end
end
