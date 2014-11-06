class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :firstname
      t.string :lastname
      t.string :country
      t.string :role
      t.timestamps
    end
  end
end
