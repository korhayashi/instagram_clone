class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :parent_entry_id
      t.text :content
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
