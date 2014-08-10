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

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :delete_all
  validates :title, :presence => true
end
