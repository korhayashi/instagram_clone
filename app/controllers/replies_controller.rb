class RepliesController < ApplicationController
  before_action :not_logged_in
  before_action :not_your_reply, only: [:destroy]

  def create
    @reply = current_user.replies.build(reply_params)
    # @reply = Reply.new(reply_params)
    # @reply.user_id = current_user.id
    # この2行が上記になる
    if @reply.save
      redirect_to entries_path
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to entries_path
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :entry_id)
  end

  def not_your_reply
    @reply = Reply.find(params[:id])
    unless current_user.id == @reply.user_id
      redirect_to entries_path
    end
  end
end
