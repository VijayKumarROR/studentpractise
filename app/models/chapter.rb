class Chapter < ActiveRecord::Base
	has_many :questions
	has_many :answered_questions
	belongs_to :topic
	has_many :answer_keys
end
