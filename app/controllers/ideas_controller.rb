class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def index
    @ideas = Idea.all
  end

  def destroy
    @idea.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @idea.update idea_params
    redirect_to @idea
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea = Idea.find params[:id]
  end
end
