class BookmarksController < ApplicationController
  before_action :not_logged_in

  def create
    bookmark = current_user.bookmarks.create(entry_id: params[:entry_id])
    redirect_to entries_path
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to entries_path
  end
end
