class CustomerMailer < ApplicationMailer
  def welcome_email
    @customer = params[:customer]
    if Truemail.validate(@customer.email).result.success
    mail(to: @customer.email, subject: 'Bienvenue parmi nous')
  end
  end

  def notify_followers_email
    @happy_price = params[:happy_price]
    @item = @happy_price.item
    @business = @item.business
    @business.customers.each do |customer|
      @customer = customer

      if Truemail.validate(@customer.email).result.success
      mail(to: @customer.email, subject: 'Nouveau Happy Minute !')
      end
      
    end
  end
end