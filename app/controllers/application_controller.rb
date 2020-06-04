class ApplicationController < ActionController::Base

# If I want CanCanCan to authorize all resournces:
  # check_authorization





rescue_from CanCan::AccessDenied do |exception|
  # flash[:error] = exception.message
  redirect_to root_url, notice: 'Access denied'
  # redirect_to items_path, notice: 'Access denied'
end

# rescue_from CanCan::AuthorizationNotPerformed do |exception|
#   flash[:error] = exception.message
#   redirect_to new_user_session_path
#   redirect_to root_url
# end

end
