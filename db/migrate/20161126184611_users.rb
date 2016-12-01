class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name, null: false
  		t.string :last_name, null: false
  		t.string :location, null: false
  		t.string :email, null: false
  		t.string :encrypted_password, null: false
  	end
  end
end
