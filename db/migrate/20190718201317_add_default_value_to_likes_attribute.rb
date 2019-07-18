class AddDefaultValueToLikesAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :likes, :integer, default: 0
  end
end
