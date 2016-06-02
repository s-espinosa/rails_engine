class Api::V1::Merchants::MostRevenueController < Api::ApiController
  def index
    respond_with Merchant.most_revenue(params[:quantity])
  end
end
