class UserTypeController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    user = User.find(current_user.id)
    if user.user_type? :admin
      redirect_to help_path, :notice => "hello Admin!"
    elsif user.user_type? :student
      redirect_to layout_path, :notice => "hello student!"
    else
      respond_to do |format|
        format.html # dashboard.html.erb
      end
    end
  end

end