class BusinessQrCodesController < ApplicationController
  layout 'qr_page'

  before_action :authenticate_owner!

  def index
    @business = Business.find(params[:business_id])
    if current_owner != @business.owner
      redirect_to business_path(@business), flash: { warning: 'Vous ne pouvez obtenir le QR code que de vos établissements !' }
    end
    @url = business_url(@business)
    @qrcode = RQRCode::QRCode.new(@url)
    @qrcode_svg = @qrcode.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 6)
  end
end
