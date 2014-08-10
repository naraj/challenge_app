# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  contents   :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  answered   :boolean          default(FALSE), not null
#

FactoryGirl.define do
  factory :question do
    title "Simple question"
    contents "Long description of a problem."
    user
  end
end
