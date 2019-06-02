class ChangeUserToLog < ActiveRecord::Migration[5.2]
  def change
    change_column :logs, :user_id, :integer, limit: 8, null: false
  end
end
