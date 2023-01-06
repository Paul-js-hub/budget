class ExpensesController < ApplicationController
  def index; end

  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
    @expense.user_id = current_user.id
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    @expense.category_id = @category.id

    if @expense.save
      redirect_to category_path(@expense.category_id)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
