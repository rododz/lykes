Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret, :scope => 'email,user_birthday,read_stream,status_update,friends_likes'
end
