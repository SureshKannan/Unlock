class AddFieldInCarts < ActiveRecord::Migration
  def change
    add_column :carts, :invoiceamount, :decimal
    add_column :carts, :recivedamount, :decimal
    add_column :carts, :discount, :decimal
    add_column :carts, :pin, :string
    add_column :carts, :paydate, :date
  end
end
