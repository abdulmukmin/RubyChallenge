class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :status, :string
  end

  def down
    remove_column :tasks, :status
  end
end
