class RemoveFieldsFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :title, :string
    remove_column :notes, :lists, :jsonb
  end
end
