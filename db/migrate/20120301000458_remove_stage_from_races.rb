class RemoveStageFromRaces < ActiveRecord::Migration
  def up
    remove_column :races, :stage
  end

  def down
    add_column :races, :stage, :string
  end
end
