class AlterColumnShirtSize < ActiveRecord::Migration
  def up
  	change_column :users, :shirt_size, :string, :limit => 15
  end

  def down
  	change_column :users, :shirt_size, :string, :limit => 2
  end
end
