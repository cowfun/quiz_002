class AddIdeaToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :idea, foreign_key: true
  end
end
