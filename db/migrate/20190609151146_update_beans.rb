class UpdateBeans < ActiveRecord::Migration[5.2]
  def change
    rename_column :beans, :roaster_id, :roaster_id
  end
end
