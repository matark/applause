class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :avatar
      t.string :password_digest
      t.string :refresh_token
      t.string :username
      t.string :name
      t.text :bio
      t.integer :followers_count, default: 0
      t.integer :following_count, default: 0
      t.integer :posts_count, default: 0
      t.integer :role, default: 0
      t.integer :plan, default: 0
      t.datetime :plan_due_at
      t.datetime :trashed_at
      t.datetime :locked_at
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true

    add_index :users, :trashed_at
    add_index :users, :refresh_token, unique: true
  end
end
