class Admin::BaseController < ApplicationController
  before_action :admin_check


  private

  def not_authenticated
    redirect_to admin_login_path, warning: "ログインしてください"
  end

  def admin_check
    redirect_to root_path, warning: "管理者権限を持っていません" unless current_user.admin?
  end
end
