class FamiliesController < ApplicationController
  def index
    @families = Family.all
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id
    @family.save
    redirect_to families_path
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    @family.update(family_params)
    redirect_to families_path
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to families_path
  end

  private

  def family_params
    params.require(:family).permit(:name,:gender,:birthday,:image)
  end

end
