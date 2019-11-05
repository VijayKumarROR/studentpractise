class Answer < ActiveRecord::Base
	belongs_to :question
	has_one :answered_question
end
