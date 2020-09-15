class MenusController < ApplicationController
  before_action :authenticate_owner!, except: [:show]
  before_action :is_my_business, except: [:show]

  def show
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:id])
  end

  def new
    @business = Business.find(params[:business_id])
    @menu = @business.menus.new
  end

  def create
    @business = Business.find(params[:business_id])
    @menu = @business.menus.new(menu_params)
    @menu.position = @business.menus.size
    if @menu.save
      redirect_to business_menu_path(@business, @menu), flash: { success: 'Menu créé' }
    else
      render :new
    end
  end

  def edit
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:id])
    @menu_item = @menu.menu_items.new
  end

  def update
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:id])
    if @menu.update(menu_params)
      redirect_to business_menu_path(@business), flash: { success: 'Menu mis à jour !' }
    else
      render :edit
    end
  end

  def destroy
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:id])

    @menu.destroy
    redirect_to business_menu_path(@business), flash: { success: 'Le menu a bien été supprimé !' }
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :price)
  end

  def is_my_business
    unless current_owner == Business.find(params[:business_id]).owner
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
