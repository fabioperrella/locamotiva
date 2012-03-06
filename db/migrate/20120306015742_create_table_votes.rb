class CreateTableVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :race_id
      t.integer :user_id

      t.timestamps
    end
  end
end
