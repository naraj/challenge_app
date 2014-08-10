class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :delete_all
  validates :title, :presence => true
end
