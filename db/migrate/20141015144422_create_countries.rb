class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name,:limit=>100,:null=>false
      t.string :CountryCode3letter,:limit=>3,:null=>true
      t.string :CountryCode2letter,:limit=>2,:null=>true
      t.string :status,:limit=>1,:null=>true
      t.timestamps
    end
  end
end
