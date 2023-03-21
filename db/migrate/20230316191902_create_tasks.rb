class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :note
      t.datetime :due_date
      t.datetime :completed_at
      t.integer :effort_level

      t.timestamps
    end
  end
end
