class CreateMlAuthors < ActiveRecord::Migration
  def change
    create_table :ml_authors do |t|

      t.string :name, null: false
      t.string :affiliation
      t.string :country
      t.string :email
      t.int :n_appeared

      t.timestamps null: false
    end
  end
end
