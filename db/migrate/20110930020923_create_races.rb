class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :stage
      t.datetime :race_date
      t.string :place
      t.string :distance
      t.string :url

      t.timestamps
    end
  end
end
