class CreateRoasters < ActiveRecord::Migration[5.2]
  def change
    create_table :roasters do |t|
      t.string :name
      t.string :country
      
      t.timestamps
    end
  end
end
