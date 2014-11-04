class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :code,:limit=>3,:null=>true,:unique=>true
      t.string :name,:limit=>75, :null=>false,:unique=>true
      t.string :status,:limit=>1,:null=>true
      t.timestamps
    end
  end
end
