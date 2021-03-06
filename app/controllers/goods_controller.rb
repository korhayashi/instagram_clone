class GoodsController < ApplicationController
  before_action :not_logged_in

  def create
    good = current_user.goods.create(entry_id: params[:entry_id])
    redirect_to entries_path
  end

  def destroy
    good = current_user.goods.find_by(id: params[:id]).destroy
    redirect_to entries_path
  end
end
