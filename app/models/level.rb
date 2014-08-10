# == Schema Information
#
# Table name: levels
#
#  id         :integer          not null, primary key
#  badge_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Level < ActiveRecord::Base
belongs_to :badge  
belongs_to :user  
end
