class AddAcceptedToAnswerAndAnsweredToQuestion < ActiveRecord::Migration
  def change
  	add_column :answers, :accepted, :boolean, :null => false, :default => false
  	add_column :questions, :answered, :boolean, :null => false, :default => false
  end
end
