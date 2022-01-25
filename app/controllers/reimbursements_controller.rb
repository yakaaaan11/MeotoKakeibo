class ReimbursementsController < ApplicationController
  
  def index
    @pays = current_user.pays.all
    @pays_family = @pays.group(:family_id)
    @pays_husband = @pays.where(family_id:2).where(is_active:false).sum(:price)
    @pays_wife = @pays.where(family_id:3).where(is_active:false).sum(:price)
    @wallet = Family.find(1)
    @husband = Family.find(2)
    @wife = Family.find(3)
  end

  def update
    @pay = current_user.pays.find(params[:id])
    @pay.update(is_active: true)
    redirect_to reimbursements_path
  end

  def update_husband
    @pays = current_user.pays.where(family_id:2)
    @pays.update_all(is_active: true)
    redirect_to reimbursements_path
  end

  def update_wife
    @pays = current_user.pays.where(family_id:3)
    @pays.update_all(is_active: true)
    redirect_to reimbursements_path
  end

  private

  def pay_params
    params.require(:pay).permit(:user_id,:category_id,:family_id,:price,:date,:memo,:is_active)
  end

end
