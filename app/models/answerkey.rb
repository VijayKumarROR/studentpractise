class Answerkey < ActiveRecord::Base
	serialize :question_ids, Array
	belongs_to :exam
	belongs_to :subject
	belongs_to :topic
	belongs_to :chapter
end
