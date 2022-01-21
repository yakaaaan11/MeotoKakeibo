class Category < ApplicationRecord

  has_many :pays
  has_many :budgets
  has_ancestry


  # 予算残高：予算ー支出
  def budgets_balance
    budgets.sum(:price) - pays.sum(:price)
  end

  def budgets_ratio
    pays.sum(:price)*100 / budgets.sum(:price)
  end


end
