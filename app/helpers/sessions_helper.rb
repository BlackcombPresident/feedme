module SessionsHelper
	def user_name_helper
		if session[:omniauth] 
			session[:omniauth]["info"]["name"]
		else
			"Login with Facebook"
		end	
	end

end
