class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.belongs_to :actor
      t.references :notifiable, polymorphic: true
      t.boolean :unread, default: true
      t.text :payload
      t.timestamps
    end

    add_index :notifications, [:notifiable_id, :notifiable_type]
  end
end
