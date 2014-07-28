class AddFlaggingsCountToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :flaggings_count, :integer, :null => false, :default => 0
  end
end
