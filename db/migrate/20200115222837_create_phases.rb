class CreatePhases < ActiveRecord::Migration[6.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.integer :id_board
      t.string :user_email

      t.timestamps
    end
  end
end
