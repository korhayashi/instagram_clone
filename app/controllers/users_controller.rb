class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :user_icon, :saved]

  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to entries_path
      else
        render 'new'
      end
    end
  end

  def edit

  end

  def update

  end

  def show
    @images = Entry.where(user_id: @user.id).order(created_at: :desc)
  end

  def user_icon

  end

  def saved
    @images = @user.my_bookmarks.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
