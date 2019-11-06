class Question < ActiveRecord::Base
	has_many :answer
	belongs_to :chapter
	has_one :answered_questions	
end
