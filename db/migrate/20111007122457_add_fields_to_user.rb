class AddFieldsToUser < ActiveRecord::Migration
  def up
  	add_column :users, :role, :string, :null => false
  	add_column :users, :name, :string, :null => false
  	add_column :users, :cpf, :string, :null => false
  	add_column :users, :gender, :string, :limit => 1
  	add_column :users, :shirt_size, :string, :limit => 2, :null => false
  	add_column :users, :born_at, :date
  	add_column :users, :department, :string
  end

  def down
  	remove_column :users, :role
  	remove_column :users, :name
  	remove_column :users, :cpf
  	remove_column :users, :gender
  	remove_column :users, :shirt_size
  	remove_column :users, :born_at
  	remove_column :users, :department
  end
end
