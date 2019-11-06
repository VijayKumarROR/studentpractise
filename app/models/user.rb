class User < ActiveRecord::Base
	has_many :answered_questions
	validates :email, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	serialize :unseen_ids, Array

	def correct_answer(exam, subject, topic, chapter)
		answered_questions.where(exam_id: exam, subject_id: subject,topic_id: topic,chapter_id: chapter,is_correct: 'true').count
	end

	def wrong_answer(exam, subject, topic, chapter)
		answered_questions.where(exam_id: exam, subject_id: subject,topic_id: topic,chapter_id: chapter,is_correct: 'false').count
	end

	def skip_answer(exam, subject, topic, chapter)		
		answered_questions.where(exam_id: exam, subject_id: subject,topic_id: topic,chapter_id: chapter, answer_id: nil).count
	end

end
