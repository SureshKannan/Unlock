class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.decimal :salesamount,:null=>true,:default=>0,:precision=>10,:scale=>2
      t.decimal :receiptamount,:null=>true,:default=>0,:precision=>10,:scale=>2
      t.decimal :discountamount,:null=>true,:default=>0,:precision=>10,:scale=>2
      t.string :paypaltoken
      t.string :paypalid
      t.date :datepaid,:null=>true
      t.string :status,:null=>true
      t.timestamps
    end
  end
end
