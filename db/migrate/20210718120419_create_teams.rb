class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.belongs_to :user
      t.string :name
      t.string :slug
      t.text :description
      t.timestamps
    end

    add_index :teams, :slug, unique: true
  end
end
