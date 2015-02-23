class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname , null: false
      t.string :lname , null: false
      t.string :password_digest , null: false
      t.string :uname , null: false
      t.string :email , null: false
      t.integer :phoneNumber
      t.text :imgURL 

      t.timestamps null: false
    end
  end
end
