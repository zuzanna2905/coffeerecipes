class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :roaster
      t.string :name
      t.integer :temperature
      t.integer :water
      t.integer :dose
      t.time :time
      t.string :method
      t.string :description
      t.string :grinder
      t.integer :clicks
      t.integer :user_id
      t.integer :rate
      t.integer :likes
      
      t.timestamps
    end
  end
end
