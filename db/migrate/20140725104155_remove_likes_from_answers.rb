class RemoveLikesFromAnswers < ActiveRecord::Migration
  def change
  	remove_column :answers, :likes
  end
end
