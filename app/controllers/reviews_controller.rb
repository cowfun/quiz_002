class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review, only: [:destroy]
  before_action :find_idea, only: [:create]
  before_action :authorize_user!, except: [:create]

  def create
    @review = @idea.reviews.build(review_params)
    @review.user = current_user
    @review.save
    redirect_to idea_path(@idea)
  end

  def destroy
    @review.destroy
    redirect_to idea_path(@review.idea_id)
  end

  private
  def review_params
    params.require(:review).permit(:body)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

  def authorize_user!
    # binding.pry
    unless can?(:manage, @review)
      redirect_to idea_path(@review.idea_id)
    end
  end
end
