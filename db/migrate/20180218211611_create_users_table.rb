class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
  		t.string :email
  		t.string :username
  		t.string :first_name
  		t.string :last_name
  		t.string :password
  		t.string :phone
  	end
  end
end
