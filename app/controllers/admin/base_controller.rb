class Admin::BaseController < ApplicationController
  before_action :admin_check


  private

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to admin_login_path
  end

  def admin_check
    redirect_to root_path, warning: t('defaults.message.not_authorized') unless current_user.admin?
  end
end
