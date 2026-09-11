class AddMusicUrlToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :music_url, :string
  end
end
