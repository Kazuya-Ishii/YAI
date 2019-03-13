class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :gender
      t.date :birthday
       t.text :remarks
       
      t.timestamps
    end
  end
end
