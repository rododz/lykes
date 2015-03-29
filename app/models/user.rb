class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :provider

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,  :omniauth_providers => [:facebook]

 	def self.find_from_omniauth auth_hash
    joins(:provider).where(providers: {token: auth_hash["credentials"]["token"], uid: auth_hash["uid"]}).first
	end

  def self.create_from_omniauth auth_hash
    user = create(email: auth_hash['info']['email'], password: Devise.friendly_token[0,20])
    user.create_provider(token: auth_hash["credentials"]["token"], uid: auth_hash["uid"])
    user
  end

end
