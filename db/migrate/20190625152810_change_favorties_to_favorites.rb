class ChangeFavortiesToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :favorties, :favorites
  end
end
