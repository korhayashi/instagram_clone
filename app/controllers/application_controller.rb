class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def not_logged_in
    if current_user.blank?
      redirect_to new_session_path
    end
  end

  def logged_in
    if current_user.present?
      redirect_to entries_path
    end
  end

  def defferent_user
    unless current_user.id == params[:id].to_i
      redirect_to entries_path
    end
  end
end
