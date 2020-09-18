class OwnersController < ApplicationController
  before_action :authenticate_owner!, only: [:show]
  before_action :is_my_profile, only: [:show]

  def show
    @owner = Owner.find(params[:id])
  end

  private

  def is_my_profile
    unless current_owner == Owner.find(params[:id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
