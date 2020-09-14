class MenuItemsController < ApplicationController
  before_action :authenticate_owner!, except: [:show]
  before_action :is_my_business, except: [:show]

  def create
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    if @menu_item.create(item_menu_params)
      redirect_to edit_business_menu_path(@business), flash: { success: 'Produit ajouté au menu' }
    else
      redirect_to edit_business_menu_path(@business), flash: { warning: 'Produit non ajouté' }
    end
  end

  def destroy
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @menu_item = @menu.menu_items.find(params[:id])
    @menu_item.destroy
    redirect_to edit_business_items_path(@business), flash: { success: 'Menu supprimé' }
  end

  private

  def item_menu_params
    params.require(:item_menu).permit(:item_id)
  end

  def is_my_business
    unless current_owner == Business.find(params[:business_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
