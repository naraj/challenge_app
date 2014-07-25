class AddLikesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :likes, :integer, :null => false, :default => 0
  end
end
