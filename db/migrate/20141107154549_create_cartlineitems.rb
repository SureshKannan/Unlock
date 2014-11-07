class CreateCartlineitems < ActiveRecord::Migration
  def change
    create_table :cartlineitems do |t|
      t.references :Cart
      t.references :Product
      t.string :imei,:null=>false,:limit=>50
      t.integer :quantity,:null=>false,:default=>0
      t.decimal :price,:null=>false,:default=>0,:precision=>10,:scale=>2
      t.decimal :amount,:null=>false,:default=>0,:precision=>10,:scale=>2
      t.references :Orderstatus
      t.string :comments,:null=>true,:limit=>500
      t.string :status
      t.timestamps
    end
  end
end
