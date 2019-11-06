class QuestionsController < ApplicationController
	before_filter :get_user
	
	def index
		get_user
		@skiped = AnsweredQuestion.where('answer_id IS ? AND user_id=?', nil, @user.id).pluck(:question_id)
		@attend = AnsweredQuestion.where('answer_id !=? AND user_id=?', nil, @user.id).pluck(:question_id)
		@ques = Question.where.not(id: [@skiped, @attend]).first(4)
		@ans = Answer.all.order('created_at ASC')
		@skip_answers = AnsweredQuestion.where(answer_id: nil, user_id: @user.id ).count
	end

	def create_answer
		params[:create_answer].each do |cc|
			ans_ques = AnsweredQuestion.create(question_id: cc.first, answer_id: cc.last)
		end
		flash[:notice] = "Answered successfully"
		redirect_to :back
	end

	def skip_question
		get_user
		ques = Question.find_by_id params[:ques]
		if params[:ques].present? && !params[:unskip].present?
			AnsweredQuestion.create(question_id: ques.id, user_id: @user.id)
			status = true
			#skip_count = AnsweredQuestion.create(question_id: ques.id, user_id: @user.id)
		elsif !params[:ques].present? && params[:unskip].present?
			destroy_ids = AnsweredQuestion.where(answer_id: nil, user_id: @user.id).ids
			AnsweredQuestion.destroy(destroy_ids)
			status = true
		else
			status = false
		end
		render json: {status: status}
	end

	def update_subject
	 	exam = Exam.find_by_id(params[:exam_id])
	 	subjects = exam.subjects if exam
		render json: subjects.to_json(only: [:id, :name])
	end

	def update_topics
		subject = Subject.find_by_id(params[:sub_id])
		topics = subject.topics if subject
		render json: topics.to_json(only: [:id, :name])
	end

	def update_chapters
		topic = Topic.find_by_id(params[:topic_id])
		chapters = topic.chapters if topic
		render json: chapters.to_json(only: [:id, :name])
	end

	def show_questions
		get_user
		@ques = Answerkey.find_by(exam_id:params[:exam],subject_id:params[:subject],topic_id:params[:topic],chapter_id:params[:chapter])
		binding.pry
		respond_to do |format|
			format.html
			format.js
		end
	end

	private

	def get_user
		if User.find_by_email(session[:email])
			@user = User.find_by_email(session[:email])
		else
		end
	end

	def answered_question_params
		#params.require(:create_answer).permit()
	end

end
