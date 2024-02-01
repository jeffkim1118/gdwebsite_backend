class ReviewsController < ApplicationController
    def create
        @review = Review.new(review_params)
        if @review.save
            render json: @review, status: :created
        else
            render json: { error: review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
        def review_params
            params.require(:review).permit(:user_id, :game_id, :rating, :comment)
        end
end
