class AddLikesAndAcceptedToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :likes, :integer, :null => false, :default => 0
  	add_column :answers, :accepted, :boolean, :null => false, :default => false
  end
end
