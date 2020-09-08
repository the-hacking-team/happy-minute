class StaticPagesController < ApplicationController
  layout "crystal", only: [:crystal_template, :kit_ui]

  def home
  end

  def crystal_template
  end 

  def kit_ui
  end 
end
