# == Schema Information
#
# Table name: badges
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  points               :integer
#  default              :boolean
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
