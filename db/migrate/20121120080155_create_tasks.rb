class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.integer :position
      t.boolean :archived
      t.references :goal

      t.timestamps
    end
  end
end
