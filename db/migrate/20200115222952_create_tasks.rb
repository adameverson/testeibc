class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :task
      t.integer :id_phase
      t.string :user_email

      t.timestamps
    end
  end
end
