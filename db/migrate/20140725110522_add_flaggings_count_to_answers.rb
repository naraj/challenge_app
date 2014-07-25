class AddFlaggingsCountToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :flaggings_count, :integer
  end
end
