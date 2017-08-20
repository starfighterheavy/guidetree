class AddCompletionNoteToObjective < ActiveRecord::Migration[5.1]
  def change
    add_column :objectives, :completion_note, :text
    rename_column :objectives, :completed, :completed_at
  end
end
