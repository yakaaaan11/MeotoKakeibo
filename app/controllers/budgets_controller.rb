class BudgetsController < ApplicationController
  def index
    @today = Date.today
    @pays_month = current_user.pays.where(date: @today.all_month)
    @pays_month_ratio = @pays_month.group(:category_id).sum(:price).sort_by {|_,v|v}.reverse.to_h
    @pays_month_total = @pays_month.inject(0) {|sum,pay| sum + pay.price}

    @budgets = current_user.budgets.all
    @budgets_total = @budgets.inject(0) {|sum,budget| sum + budget.price}
    @budget_month_ratio = @pays_month_total*100 / @budgets_total

    @category_parent_array = Category.where(ancestry: nil)


  end

  def new
  end

  def edit
  end
end
