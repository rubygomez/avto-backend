class ChangeTotalPriceToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :total_price, :integer
  end
end
