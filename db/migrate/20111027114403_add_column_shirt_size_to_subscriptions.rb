class AddColumnShirtSizeToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :shirt_size, :string, :limit => 15
  end
end
