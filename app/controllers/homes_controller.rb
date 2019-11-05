class HomesController < ApplicationController

	def index
	end

	def create_login
		if params[:create_login][:email].present?
			if User.find_by_email params[:create_login][:email]
				user = User.find_by_email params[:create_login][:email]
				if user.email.eql?(params[:create_login][:email]) && user.password == params[:create_login][:password]
					session[:email] = user.email
					redirect_to questions_path
				else
					flash[:error] = "Password doesnt match"
					redirect_to :back
				end
			else
				flash[:notice] = "Email id not registered with us"
				redirect_to :back
			end
		end
	end

	def logout
		if User.find_by_email(session[:email])
			session[:email] = nil
			redirect_to homes_path, notice: 'Signout Successfully'
		end
	end
	
end
