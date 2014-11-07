class CreateOrderstatuses < ActiveRecord::Migration
  def change
    create_table :orderstatuses do |t|
      t.string :name,:limit=>75,:null=>false
      t.timestamps
    end
  end
end
