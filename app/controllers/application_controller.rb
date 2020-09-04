class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'layouts/application'
    end
  end
end
