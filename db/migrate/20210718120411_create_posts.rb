class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.belongs_to :team
      t.belongs_to :user
      t.string :nanoid
      t.string :title
      t.text :body
      t.boolean :archived, default: false
      t.integer :reactions_count, default: 0
      t.integer :comments_count, default: 0
      t.integer :reports_count, default: 0
      t.integer :hits_count, default: 0
      t.datetime :published_at
      t.datetime :trashed_at
      t.timestamps
    end

    add_index :posts, :nanoid, unique: true
    add_index :posts, :published_at
    add_index :posts, :trashed_at
  end
end
