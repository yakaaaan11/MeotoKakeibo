class HomesController < ApplicationController
  def top
  end

  def profile
    # 今月の支出
    @today = Date.today
    @pays = current_user.pays.all
    @pays_total = @pays.sum(:price)
    @pays_month = current_user.pays.where(date: @today.all_month)
    @pays_month_ratio = @pays_month.group(:category_id).sum(:price).sort_by {|_,v|v}.reverse.to_h
    @pays_month_total = @pays_month.sum(:price)
    # 予算
    @budgets = current_user.budgets.all
    @budgets_total = @budgets.sum(:price)

    # 予算比
    @budget_month_ratio = @pays_month_total*100 / @budgets_total

    # 収入
    @incomes = current_user.incomes.all
    @incomes_total = @incomes.sum(:price)
    @incomes_month = current_user.incomes.where(date: @today.all_month)
    @incomes_month_total = @incomes_month.sum(:price)

    # 預金
    @deposit = current_user.deposit.price


    # 残高
    @balances_total = @deposit+ @incomes_total - @pays_total
    @balances_month_total = @incomes_month_total - @pays_month_total


  end
end
