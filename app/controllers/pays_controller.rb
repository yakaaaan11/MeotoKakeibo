class PaysController < ApplicationController
  def index
    @today = Date.today
    @pays = current_user.pays.all.order(date: "asc")
    @pays_total = @pays.inject(0) {|sum,pay| sum + pay.price}
    @pays_month = current_user.pays.where(date: @today.all_month).order(date: "asc")
    @pays_month_total = @pays_month.inject(0) {|sum,pay| sum + pay.price}

    @incomes = current_user.incomes.all.order(date: "asc")
    @incomes_total = @incomes.inject(0) {|sum,income| sum + income.price}
    @incomes_month = current_user.incomes.where(date: @today.all_month).order(date: "asc")
    @incomes_month_total = @incomes_month.inject(0) {|sum,income| sum + income.price}

    @deposit = current_user.deposit.price

    @balances_total = @deposit+ @incomes_total - @pays_total
    @balances_month_total = @incomes_month_total - @pays_month_total
    # カレンダー収支
    @balances = @pays + @incomes
    @balances_month = @pays_month + @incomes_month
  end

  def new
    @pay = Pay.new
    @category_parent_array = Category.where(ancestry: nil)
    @families = Family.where(params[:id])
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    # 選択された親カテゴリーに紐づく子カテゴリーの配列を取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def create
    @pay = Pay.new(pay_params)
    @pay.user_id = current_user.id
    @pay.save
    redirect_to pays_path
  end

  def edit
    @pay = Pay.find(params[:id])
    @category_parent_array = Category.where(ancestry: nil)
    @families = Family.where(params[:id])
  end

  def update
    @pay = Pay.find(params[:id])
    @pay.update(pay_params)
    redirect_to pays_path
  end

  def destroy
    @pay = Pay.find(params[:id])
    @pay.destroy
    redirect_to pays_path
  end



  private

  def pay_params
    params.require(:pay).permit(:user_id,:category_id,:family_id,:price,:date,:memo)
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  def deposit_params
    params.require.(:deposit).permit(:user_id,:price)
  end

end
