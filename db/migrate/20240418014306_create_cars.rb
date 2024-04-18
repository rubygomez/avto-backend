class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :model
      t.string :make
      t.integer :year
      t.string :color
      t.integer :rate
      t.string :seats
      t.string :transmission

      t.timestamps
    end
  end
end
