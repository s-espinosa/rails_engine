class Api::V1::MerchantsController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end
end
