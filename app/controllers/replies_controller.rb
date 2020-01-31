class RepliesController < ApplicationController
  before_action :set_reply, only: [:edit, :update, :destroy]

  def create
    @reply = Reply.new(reply_params)
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
