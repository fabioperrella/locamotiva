class AddStateToRace < ActiveRecord::Migration
  def change
    add_column :races, :state, :string
    remove_column :races, :confirmed
  end
end
