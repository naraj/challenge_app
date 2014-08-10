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

FactoryGirl.define do
  factory :answer do
    contents "Best answer ever"
    question
    user
  end
end
