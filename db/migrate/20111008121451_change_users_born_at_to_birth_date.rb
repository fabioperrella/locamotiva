class ChangeUsersBornAtToBirthDate < ActiveRecord::Migration
  def up
  	rename_column :users, :born_at, :birth_date
  end

  def down  	
  end
end
