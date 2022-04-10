class ApplicationController < ActionController::Base
  #デフォルトではnoticeとalertのみのため追加する
  add_flash_types :success, :info, :warning, :danger
  #ログインしていなければ、掲示板機能を利用できなくする
  before_action :login_required

  private
    #def before_action :login_required機能を使ってログインしているか判別しているのだからunless current_user
      #redirect_to login_url ,warning: t('defaults.require_login') unless current_user
      #2行目に書くと、unlessが読み込まれない
      #flash[:warning] = t('defaults.require_login')
    #end
    def not_authenticated
      flash[:warning] = t('defaults.require_login')
      redirect_to login_path
    end
end
