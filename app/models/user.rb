class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers
  make_flagger :flag_once => true

  def to_s
  	if name.empty?
  		email
  	else
  		name
  	end
  end
end
