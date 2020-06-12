class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content 
      t.string :title
      t.string :review 
      t.integer :user_id 
      t.integer :rating
    end
  end
end
