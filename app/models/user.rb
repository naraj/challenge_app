class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_attached_file :avatar, :styles => { 
                                :medium => ["300x300>", :jpg, :quality => 70],
                                :thumb => ["100x100#", :jpg, :quality => 70]

                                }, 
                    :default_url => "default/default-avatar.png",
                    :url => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar

  has_many :questions
  has_many :answers
  make_flagger

  def to_s
  	if name.empty?
  		email
  	else
  		name
  	end
  end
end
