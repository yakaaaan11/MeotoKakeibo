class IncomesController < ApplicationController
  
  def new
    @income = Income.new
    @families = Family.where(params[:id])
  end

  def create
    @income = Income.new(income_params)
    @income.user_id = current_user.id
    @income.save
    redirect_to pays_path
  end

  def edit
    @income = Income.find(params[:id])
    @families = Family.where(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    @income.update(income_params)
    redirect_to pays_path
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to pays_path
  end

  private

  def income_params
    params.require(:income).permit(:user_id,:family_id,:price,:date,:memo)
  end
end
