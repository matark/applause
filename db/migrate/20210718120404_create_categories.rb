class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.integer :posts_count, default: 0
      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
