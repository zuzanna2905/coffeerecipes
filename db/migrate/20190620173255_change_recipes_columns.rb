class ChangeRecipesColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :roaster, :roaster_id
    rename_column :recipes, :name, :bean_id
  end
end
