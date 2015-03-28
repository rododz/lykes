class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		facebook = request.env['omniauth.auth']
		redirect_to root_url
	end

end