class AddFlaggingsCountToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :flaggings_count, :integer, :null => false, :default => 0
  end
end
