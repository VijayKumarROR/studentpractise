class Subject < ActiveRecord::Base
	has_many :topics
	has_many :answered_questions
	belongs_to :exam
	has_many :subjects
end
