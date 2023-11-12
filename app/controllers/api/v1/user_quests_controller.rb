class Api::V1::UserQuestsController < ApplicationController
  before_action :set_user_quest, only: %i[show update destroy]

  def index
    @user_quests = UserQuest.all
    render json: @user_quests
  end

  def show
    render json: @user_quest
  end

  def create
    @user_quest = UserQuest.new(user_quest_params)
    if @user_quest.save
      render json: @user_quest, status: :created, location: @user_quest
    else
      render json: @user_quest.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_quest.update(user_quest_params)
      render json: @user_quest
    else
      render json: @user_quest.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_quest.destroy!
  end

  private

  def set_user_quest
    @user_quest = UserQuest.find(params[:id])
  end

  def user_quest_params
    params.require(:user_quest).permit(:user_id, :quest_id, :progress, :ranking)
  end
end
