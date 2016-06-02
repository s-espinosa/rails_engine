class Api::V1::Merchants::RevenueController < Api::ApiController
  def show
    respond_with Merchant.revenue(params[:id])
  end
end
