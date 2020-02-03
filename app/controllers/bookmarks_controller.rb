class BookmarksController < ApplicationController
  def create
    bm = current_user.bookmarks.create(entry_id: params[:entry_id])
    redirect_to entries_path
  end

  def destroy
    bm = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to entries_path
  end
end
