class AddRecipesRate < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :rate, :integer
  end
end
