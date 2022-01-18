class PaysController < ApplicationController



  def index
    @today = Date.today
    @pays = current_user.pays.all.order(date: "asc")
    @pays_total = @pays.sum(:price)
    @pays_month = current_user.pays.where(date: @today.all_month).order(date: "asc")
    @pays_month_total = @pays_month.sum(:price)

    @incomes = current_user.incomes.all.order(date: "asc")
    @incomes_total = @incomes.sum(:price)
    @incomes_month = current_user.incomes.where(date: @today.all_month).order(date: "asc")
    @incomes_month_total = @incomes_month.sum(:price)

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
    @parent_categories = Category.roots
    @default_child_categories = @parent_categories.first.children
  end

  # 親カテゴリー選択後に動くアクション
  def dynamic_select_category
    @category = Category.find(params[:category_id])
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
    params.require(:pay).permit(:user_id,:category_id,:family_id,:price,:date,:memo,:is_active)
  end



  def deposit_params
    params.require.(:deposit).permit(:user_id,:price)
  end

end
