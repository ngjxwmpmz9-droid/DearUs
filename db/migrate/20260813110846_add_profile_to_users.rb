class AddProfileToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :age, :string
    add_column :users, :bloodtype, :string
    add_column :users, :zodiac, :string
    add_column :users, :bodyflame, :string
    add_column :users, :personalcolor, :string
    add_column :users, :hobby, :string
    add_column :users, :mbti, :string
    add_column :users, :lovetype, :string
    add_column :users, :encounter, :text
    add_column :users, :fashion, :string
    add_column :users, :descript, :string
  end
end
