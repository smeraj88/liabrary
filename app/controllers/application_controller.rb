class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token
 rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
