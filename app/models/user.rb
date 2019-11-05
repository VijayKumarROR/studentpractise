class User < ActiveRecord::Base
	has_many :answered_questions
	validates :email, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
end
