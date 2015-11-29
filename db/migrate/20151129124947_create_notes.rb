class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.jsonb :lists, null: false, default: '{}'

      t.timestamps null: false
    end

    add_index  :notes, :lists, using: :gin
  end
end
