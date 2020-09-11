class BusinessesController < ApplicationController

  before_action :authenticate_owner!, only: [:new, :create, :destroy, :edit, :update]
  
  def index
    @businesses = Business.all
    @is_from_root = true
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create  
    @business = Business.new(business_params)
    @business.owner = current_owner

    if @business.save
      flash[:success] = "Votre établissement a été créé avec succès !"
      redirect_to owner_path(current_owner)
    else
      render new_business_path
    end 
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
      redirect_to edit_business_path(@business.id)
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to root_path
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :phone)
  end 

end
