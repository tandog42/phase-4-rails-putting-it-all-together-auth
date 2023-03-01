class RecipesController < ApplicationController
  def index
    render json: Recipe.all
  end

  def create
    recipe = @current_user.recipes.create!(permitted_params)
    render json: recipe, status: :created
  end

  private

  def permitted_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
end
