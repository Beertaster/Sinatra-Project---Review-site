class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t| 
      t.string :name 
      t.string :rank
      t.string :category 
      t.string :password_digest 
      
    end 
  end
end
