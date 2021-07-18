class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.belongs_to :user
      t.references :reportable, polymorphic: true
      t.text :reason
      t.timestamps
    end
  end
end
