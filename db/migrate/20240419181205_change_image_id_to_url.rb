class ChangeImageIdToUrl < ActiveRecord::Migration[7.1]
  def change
    rename_column :cars, :image_id, :image_url
  end
end
