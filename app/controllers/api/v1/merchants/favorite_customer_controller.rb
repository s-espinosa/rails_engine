class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController
  def show
    respond_with Merchant.favorite_customer(params[:id])
  end
end
