# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  question_id     :integer
#  user_id         :integer
#  contents        :text
#  created_at      :datetime
#  updated_at      :datetime
#  flaggings_count :integer          default(0), not null
#  accepted        :boolean          default(FALSE), not null
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :contents, :presence => true

  make_flaggable
end
