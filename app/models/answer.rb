class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :contents, :presence => true

  make_flaggable
end
