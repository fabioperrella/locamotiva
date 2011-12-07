class AddColumnConfirmedToRaces < ActiveRecord::Migration
  def self.up
    add_column :races, :confirmed, :boolean
  end

  def self.down
    remove_column :races, :confirmed
  end
end
