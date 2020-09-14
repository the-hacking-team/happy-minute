class MenuItemsController < ApplicationController
  before_action :authenticate_owner!, except: [:show]
  before_action :is_my_business, except: [:show]

  def new
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @menu_item = @menu.menu_items.new
  end

  def create
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
    puts params
    @menu_item = @menu.menu_items.new(item_menu_params)
    if @menu_item.save
      redirect_to business_menu_path(id: @menu.id)
    else
      redirect_to business_menu_path(@menu)
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
    params.require(:menu_item).permit(:item_id)
  end

  def is_my_business
    unless current_owner == Business.find(params[:business_id]).owner
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
