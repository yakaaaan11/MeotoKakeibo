class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(deposit_params)
    @deposit.save
    redirect_to profile_path
  end

  private
  def deposit_params
    params.require(:deposit).permit(:user_id,:price)
  end
end
