class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new

  end

  def create
  
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to business_path(@business.id)
    else
      flash[:warning] = "Nous n'avons pas pu modifier votre établissement"
      render edit_business_path(@business.id)
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to root_path
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :phone, :photo)
  end 

end
