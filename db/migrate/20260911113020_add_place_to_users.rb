class AddPlaceToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :place, :string
  end
end
