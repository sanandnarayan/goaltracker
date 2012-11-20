class AddNotesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :notes, :text
  end
end
