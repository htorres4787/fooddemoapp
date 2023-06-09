class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    @list_of_restaurants = Restaurant.all

    render({ :template => "reviews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    render({ :template => "reviews/show.html.erb" })
  end

  def create
    the_review = Review.new
    the_review.user_id = session[:user_id]
    the_review.food_id = params.fetch("query_food_id")
    the_review.body = params.fetch("query_body")
    the_review.restaurant_id = params.fetch("query_restaurant_id")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.user_id = params.fetch("query_user_id")
    the_review.food_id = params.fetch("query_food_id")
    the_review.body = params.fetch("query_body")
    the_review.restaurant_id = params.fetch("query_restaurant_id")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully." })
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully." })
  end
end
