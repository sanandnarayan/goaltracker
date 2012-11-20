class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.boolean :archived
      t.integer :position
      t.references :user

      t.timestamps
    end
  end
end
