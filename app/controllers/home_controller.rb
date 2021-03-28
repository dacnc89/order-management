class HomeController < ApplicationController
  def index
    @user = current_user.presence
  end
end
