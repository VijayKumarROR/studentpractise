class Topic < ActiveRecord::Base
	has_many :chapters
	has_many :answered_questions
	belongs_to :subject
	has_many :answer_keys
end
