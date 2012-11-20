class CreateTomatoes < ActiveRecord::Migration
  def change
    create_table :tomatoes do |t|
      t.datetime :from
      t.datetime :to
      t.integer :duration
      t.boolean :completed
      t.references :user

      t.timestamps
    end
    add_index :tomatoes, :user_id
  end
end
