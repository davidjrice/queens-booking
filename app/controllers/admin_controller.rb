class AdminController < ApplicationController
  layout "admin"
  before_filter :verify_admin

  def verify_admin
    :authenticate_user!
    redirect_to root_url unless user.user_type?(current_user, 'admin')
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_user)
  end
end