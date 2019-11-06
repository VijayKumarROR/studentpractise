class QuestionsController < ApplicationController
	before_filter :get_user
	
	def index
		get_user
		@skiped = AnsweredQuestion.where('answer_id IS ? AND user_id=?', nil, @user.id).pluck(:question_id)
		@attend = AnsweredQuestion.where('answer_id !=? AND user_id=?', nil, @user.id).pluck(:question_id)
		@ques = Question.where.not(id: [@skiped, @attend]).first(4)
		@ans = Answer.all.order('created_at ASC')
		@wrong = 
		@skip_answers = AnsweredQuestion.where(answer_id: nil, user_id: @user.id)
		@wrongs = AnsweredQuestion.where(user_id: @user.id, is_correct: 'false')		
		unless @user.unseen_ids.count == Question.all.ids.count
			@user.unseen_ids = Question.all.ids
			@user.unseen_ids.uniq
			@user.save
		end
	end

	def create_answer		
		params[:create_answer].each do |cc|
			correct_or_no = Key.find_by(question_id: cc.first, answer_id: cc.last) ? 'true' : 'false'
			ans_ques = AnsweredQuestion.create(question_id: cc.first, answer_id: cc.last, exam_id: params[:exam_id], subject_id: params[:sub_id], topic_id: params[:topic_id], chapter_id: params[:chapter_id], user_id: params[:user_id], is_correct: correct_or_no)
			AnsweredQuestion.find_by(question_id: cc.first, answer_id: nil, user_id: @user.id).try(:delete)
		end
		flash[:notice] = "Answered successfully"
		redirect_to :back
	end

	def skip_question
		get_user
		ques = Question.find_by_id params[:ques]
		if params[:ques].present? && !params[:unskip].present?
			AnsweredQuestion.find_or_create_by(question_id: ques.id, user_id: @user.id, exam_id: params[:exam], subject_id: params[:sub], topic_id: params[:topic], chapter_id: params[:chapter])
			status = true			
		elsif !params[:ques].present? && params[:unskip].present?
			destroy_ids = AnsweredQuestion.where(answer_id: nil, user_id: @user.id).ids
			AnsweredQuestion.destroy(destroy_ids)
			status = true
		else
			status = false
		end
		@skip_count = AnsweredQuestion.where(user_id: @user.id, answer_id: nil).count
		render json: {status: status, skip_count: @skip_count}
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
		@questions = Answerkey.find_by(exam_id:params[:exam],subject_id:params[:subject],topic_id:params[:topic],chapter_id:params[:chapter])
		@get_answered_question = AnsweredQuestion.where(question_id: @questions.try(:question_ids), user_id: @user.id).where.not(answer_id: nil).pluck(:question_id)
		@skipped = AnsweredQuestion.where(user_id: @user.id, answer_id: nil, chapter_id: params[:chapter]).pluck(:question_id)
		@not_answered = @questions.try(:question_ids) - @get_answered_question if @questions.try(:question_ids).present?
		if @user.answered_questions.count == Question.all.count
			@ques = Question.where.not(id:@get_answered_question).where(chapter_id: params[:chapter])
		else
			@ques = Question.where.not(id:@skipped+@get_answered_question).where(chapter_id: params[:chapter])
		end			
		@chapter_have_ques = Chapter.find_by_id(params[:chapter])
		@user.unseen_ids - @chapter_have_ques.questions
		@user.save
		respond_to do |format|
			format.html
			format.js
		end
	end

	def clear_datas
		get_user
		AnsweredQuestion.where(user_id: @user.id).destroy_all
		flash[:notice] = "Records has been cleared"
		redirect_to :back
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
