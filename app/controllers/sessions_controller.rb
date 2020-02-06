class SessionsController < ApplicationController
  before_action :logged_in

  def new
  end

  def create
    user =
    if params[:session][:user_name_or_email].match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) == nil
      User.find_by(user_name: params[:session][:user_name_or_email])
    else
      User.find_by(email: params[:session][:user_name_or_email].downcase)
    end

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to entries_path
    else
      flash.now[:danger] = 'ログインに失敗しました。メールアドレス、ユーザーネーム、パスワードのいずれかが間違っています。'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
