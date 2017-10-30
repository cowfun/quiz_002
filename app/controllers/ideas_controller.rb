class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:new, :create, :index, :show]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
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

  def authorize_user!
    # binding.pry
    unless can?(:manage, @post)
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end
end
