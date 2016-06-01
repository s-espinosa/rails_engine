class Api::V1::MerchantsController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with FindByHelper.find_by(params, Merchant)
  end

  def find_all
    respond_with FindByHelper.find_all_by(params, Merchant)
  end

  def random
    respond_with Merchant.order("RANDOM()").limit(1).first
  end
end
