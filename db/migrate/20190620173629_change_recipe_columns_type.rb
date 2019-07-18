class ChangeRecipeColumnsType < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :roaster_id, 'integer USING CAST(roaster_id AS integer)'
    change_column :recipes, :bean_id, 'integer USING CAST(bean_id AS integer)'
  end
end
