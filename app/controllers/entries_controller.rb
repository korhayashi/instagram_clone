class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.order(created_at: :desc)
    @all_reply = Reply.all
    @reply = Reply.new
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.build(entry_params)
    # @entry = Entry.new(entry_params)
    # @entry.user_id = current_user.id
    # この2行が上記になる
    if @entry.save
      redirect_to entries_path
    else
      render 'new'
    end
  end

  def show
    @replies = Reply.where(entry_id: @entry.id)
    @reply = Reply.new
  end

  def edit

  end

  def update

  end

  def destroy
    @entry.destroy
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:image, :image_cache, :content)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
