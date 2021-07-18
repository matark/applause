class CreateTeamUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_users do |t|
      t.belongs_to :team
      t.belongs_to :user
      t.integer :state, default: 0
      t.integer :role, default: 0
      t.timestamps
    end
  end
end
