class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.references :Customer
      t.string :username,:limit=>255,:null=>false,:unique=>true
      t.string :password,:limit=>75,:null=>false
      t.string :status,:limit=>1,:null=>true
      t.timestamps
    end
  end
end
