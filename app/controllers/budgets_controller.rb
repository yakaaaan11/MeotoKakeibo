class BudgetsController < ApplicationController
  def index
    @budgets = current_user.budgets.all
  end

  def new
  end

  def edit
  end
end
