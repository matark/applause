class CreatePostHits < ActiveRecord::Migration[6.1]
  def change
    create_table :post_hits do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string :ip_address
      t.string :device_token
      t.timestamps
    end
  end
end
