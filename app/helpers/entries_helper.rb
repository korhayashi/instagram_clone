module EntriesHelper
  def choose_new_or_edit_entry
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_entries_path
    elsif
      entry_path
    end
  end
end
