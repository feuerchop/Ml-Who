class AddColumnToUser < ActiveRecord::Migration
  def change
     add_column :users, :pic_path, :string
  end
end
