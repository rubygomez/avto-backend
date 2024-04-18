class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :car_id
      t.date :book_start
      t.date :book_end
      t.float :total_price

      t.timestamps
    end
  end
end
