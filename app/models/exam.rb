class Exam < ActiveRecord::Base
	has_many :subjects
	has_many :answered_questions
	has_many :answer_keys
end
