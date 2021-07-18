class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :followable, polymorphic: true
      t.references :follower, polymorphic: true
      t.boolean :blocked, default: false
      t.timestamps
    end

    add_index :follows, [:followable_id, :followable_type]
    add_index :follows, [:follower_id, :follower_type]
  end
end
