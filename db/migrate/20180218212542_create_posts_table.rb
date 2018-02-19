class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.datetime :created_at
  		t.string :content
  		t.references :user
  	end
  end
end
