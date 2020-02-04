class RepliesController < ApplicationController
  before_action :set_reply, only: [:edit, :update, :destroy]

  def create
    @reply = current_user.replies.build(reply_params)
    # @reply = Reply.new(reply_params)
    # @reply.user_id = current_user.id
    # この2行が上記になる
    if @reply.save
      redirect_to entries_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def reply_params
    params.require(:reply).permit(:content, :entry_id)
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end
end
