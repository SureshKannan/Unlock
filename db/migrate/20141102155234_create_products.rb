class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description,:null=>false,:unique=>true,:limit=>150
      t.string :imageurl,:limit=>255,:null=>false
      t.references :currency,:null=>false
      t.references :country,:null=>false
      t.decimal :price,:null=>false,:default=>0,:precision=>10,:scale=>2
      t.string :deliveryterms,:null=>true,:limit=>500
      t.string :status,:null=>true
      t.timestamps
    end
  end
end
