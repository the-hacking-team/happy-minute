# frozen_string_literal: true

class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def update; end
end
