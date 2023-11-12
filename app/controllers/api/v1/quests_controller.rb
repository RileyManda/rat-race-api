class Api::V1::QuestsController < ApplicationController
  before_action :set_quest, only: %i[show update destroy]

  def index
    @quests = Quest.all
    render json: @quests
  end

  def show
    render json: @quest
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      render json: @quest, status: :created, location: @quest
    else
      render json: @quest.errors, status: :unprocessable_entity
    end
  end

  def update
    if @quest.update(quest_params)
      render json: @quest
    else
      render json: @quest.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @quest.destroy!
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:name, :description, :duration)
  end
end
