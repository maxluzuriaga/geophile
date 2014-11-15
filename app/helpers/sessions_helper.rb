module SessionsHelper
	def sign_in(user)
		session[:user_id] = user.user_id
		current_user = user
	end

	def curent_user=(user)
		@current_user = user
	end

	def sign_out
		session[:user_id] = nil
		current_user = nil
	end

	def signed_in?
		!current_user.nil?
	end
end
