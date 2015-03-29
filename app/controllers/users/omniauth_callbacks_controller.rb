class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		facebook = request.env['omniauth.auth']
		user = User.find_from_omniauth(facebook)
		user ||= User.create_from_omniauth(facebook) 	
		sign_in user
		redirect_to root_url
	end

end