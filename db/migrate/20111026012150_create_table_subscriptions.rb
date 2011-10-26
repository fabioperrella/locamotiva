class CreateTableSubscriptions < ActiveRecord::Migration
  def up
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :race_id
      
      t.timestamps
    end
  end

  def down
  end
end
