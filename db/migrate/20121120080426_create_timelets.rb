class CreateTimelets < ActiveRecord::Migration
  def change
    create_table :timelets do |t|
      t.datetime :from
      t.datetime :to
      t.integer :duration
      t.references :task

      t.timestamps
    end
    add_index :timelets, :task_id
  end
end
