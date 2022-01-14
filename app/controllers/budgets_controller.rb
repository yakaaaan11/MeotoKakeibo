class BudgetsController < ApplicationController
  def index
    # @budgets = current_user.budgets.all
  end
  def new
    @form = Form::BudgetCollection.new
    @category_parent_array = Category.where(ancestry: nil)
  end
  def create

    @form = Form::BudgetCollection.new(budget_collection_params)
    # @form.budgets.user_id = current_user.id
    if @form.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def budget_collection_params
    params.require(:form_budget_collection).permit(budgets_attributes: Form::Budget::REGISTRABLE_ATTRIBUTES)
  end
end