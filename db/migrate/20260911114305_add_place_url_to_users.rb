class AddPlaceUrlToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :place_url, :string
  end
end
