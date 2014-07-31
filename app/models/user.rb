class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default/default-avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  

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
