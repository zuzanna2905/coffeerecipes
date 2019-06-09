class UpdateRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :grinder, :string
    add_column :recipes, :clicks, :integer
    add_column :recipes, :user_id, :integer
  end
end
