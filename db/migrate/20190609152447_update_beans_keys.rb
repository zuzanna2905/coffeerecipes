class UpdateBeansKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :beans, :roasters, column: :roaster_id
  end
end
