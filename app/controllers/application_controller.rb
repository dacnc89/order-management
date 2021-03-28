class ApplicationController < ActionController::Base
  before_action :verify_admin_authenticated!

  def verify_admin_authenticated!
    authenticate_user!
    @user = current_user.presence
  end
end
