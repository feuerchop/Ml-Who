class ChangeMlAuthors < ActiveRecord::Migration
  def change
     change_column :ml_authors, :n_appeared, :int
  end
end
