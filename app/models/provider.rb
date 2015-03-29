class Provider < ActiveRecord::Base
	belongs_to :user
  
  def facebook
    @facebook||=Koala::Facebook::API.new(token)
    block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end

  def fb_result
    @re||=facebook.get_connection("me","photos", {limit:15,fields:"likes"})
    # @re += facebook.get_connection("me","photos", {limit:13,fields:"likes"}).next_page
  end


end
