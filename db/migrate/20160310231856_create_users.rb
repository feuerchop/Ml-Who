class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :address
      t.string :phone
      t.timestamps null: false
    end

    add_column :users, :gender, :string
    
  end
end
