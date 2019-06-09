class CreateBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :beans do |t|
      t.string :name
      t.string :roaster
      t.string :method
      t.string :country
      t.string :roast
      t.string :description
      
      t.timestamps
    end
  end
end
