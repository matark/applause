class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.integer :kind, default: 0
      t.timestamps
    end
  end
end
