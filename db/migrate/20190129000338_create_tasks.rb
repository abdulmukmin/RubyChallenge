class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :due_date
      t.string :priority
      t.bigint :user_id

      t.timestamps
    end

    add_foreign_key :tasks, :users
  end
end
