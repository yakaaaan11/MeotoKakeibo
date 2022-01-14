class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(deposit_params)
    @deposit.user_id = current_user.id
    @deposit.save
    redirect_to profile_path
  end

  private
  def deposit_params
    params.require(:deposit).permit(:user_id,:price)
  end
end
