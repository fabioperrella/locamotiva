class RenameColumnRaceDate < ActiveRecord::Migration
  def up
    rename_column :races, :race_date, :date
  end

  def down
  end
end
