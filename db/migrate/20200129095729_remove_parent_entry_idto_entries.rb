class RemoveParentEntryIdtoEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :parent_entry_id, :integer
  end
end
