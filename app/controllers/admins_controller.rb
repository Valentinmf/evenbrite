class AdminsController < ApplicationController
  before_action :is_admin?
  before_action :authenticate_user!
  
 def index
  @user = User.all
 end

 def is_admin?
  if user_signed_in? && !current_user.is_admin
    redirect_to root_path
  end
 end
end
