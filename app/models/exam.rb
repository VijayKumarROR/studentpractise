class Exam < ActiveRecord::Base
	has_many :subjects
	has_many :answered_questions
end
