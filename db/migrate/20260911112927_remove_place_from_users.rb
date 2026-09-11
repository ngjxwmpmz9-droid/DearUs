class RemovePlaceFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :place, :string
  end
end
