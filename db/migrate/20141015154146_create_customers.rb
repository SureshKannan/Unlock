class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email,:limit=>255,:null=>false,:unique=>true
      t.string :FirstName,:limit=>100,:null=>false
      t.string :LastName,:limit=>100,:null=>false
      t.string :imei,:limit=>100,:null=>false
      t.references :Country
      t.string :Status,:limit=>1,:null=>true
      t.timestamps
    end
  end
end
