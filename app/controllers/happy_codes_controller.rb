class HappyCodesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:item_id])
    @happy_price = @item.happy_prices.find(params[:happy_price_id])
    @happy_code = @happy_price.happy_codes.create(customer_id: current_customer.id, code: @happy_price.get_new_code)
    if @happy_code
      redirect_to business_item_path(@business, @item), flash: { success: 'Félicitation ! Vous bénéficier du Happy Minute !' }
    else
      redirect_to business_item_path(@business, @item), flash: { notice: 'Le Happy Minute a expiré' }
    end
  end
end
