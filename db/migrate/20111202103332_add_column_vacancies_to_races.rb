class AddColumnVacanciesToRaces < ActiveRecord::Migration
  def self.up
    add_column :races, :vacancies, :integer
  end

  def self.down
    remove_column :races, :vacancies
  end
end
