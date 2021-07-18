class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :parent
      t.belongs_to :post
      t.belongs_to :user
      t.text :content
      t.integer :likes_count, default: 0
      t.integer :reports_count, default: 0
      t.timestamps
    end
  end
end
