class ReplyGoodsController < ApplicationController
  def create
    rep_good = current_user.reply_goods.create(reply_id: params[:reply_id])
    redirect_to entries_path
  end

  def destroy
    rep_good = current_user.reply_goods.find_by(id: params[:id]).destroy
    redirect_to entries_path
  end
end
