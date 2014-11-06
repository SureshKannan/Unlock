class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.string :imei
      t.decimal :price
      t.string :status
      t.string :paystatus 
      t.timestamps
    end
  end
end
