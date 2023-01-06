class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = @user.categories.includes(:expenses)
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.order('created_at DESC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
