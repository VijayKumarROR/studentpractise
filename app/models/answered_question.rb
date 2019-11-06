class AnsweredQuestion < ActiveRecord::Base
	belongs_to :user
	belongs_to :exam
	belongs_to :subject
	belongs_to :topic
	belongs_to :chapter
	belongs_to :question, class_name: 'Question', foreign_key: 'question_id'
	belongs_to :answer, class_name: 'Answer', foreign_key: 'answer_id'

end
