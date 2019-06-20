class ChangeRecipeColumnsType < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :roaster_id, :integer
    change_column :recipes, :bean_id, :integer
  end
end
