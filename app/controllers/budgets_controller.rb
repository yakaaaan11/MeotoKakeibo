class BudgetsController < ApplicationController
  def index
    @today = Date.today
    @pays_month = current_user.pays.where(date: @today.all_month)
    @pays_month_ratio = @pays_month.group(:category_id).sum(:price).sort_by {|_,v|v}.reverse.to_h
    hash = {}
     @pays_month_ratio.each do |key, value|
      hash[Category.find(key).name] = value
    end
    # hash を代入し直す
    @pays_month_ratio = hash
    @pays_month_total = @pays_month.sum(:price)

    @budgets = current_user.budgets.all
    @budgets_total = @budgets.sum(:price)
    @budget_month_ratio = @pays_month_total*100 / @budgets_total
    @budget_month_difference = @pays_month_total - @budgets_total

    @parent_categories = Category.roots

  end

  def new
    @parent_categories = Category.roots
    @budget = Budget.new
    @budgets = current_user.budgets.all
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    if @budget.save
      redirect_to new_budget_path
    else
      render :new
    end
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to new_budget_path
    else
      render :new
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    redirect_to new_budget_path
  end

  private

  def budget_params
    params.require(:budget).permit(:user_id,:category_id,:price)
  end
end
