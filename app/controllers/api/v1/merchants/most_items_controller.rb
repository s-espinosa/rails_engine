class Api::V1::Merchants::MostItemsController < Api::ApiController
  def index
    respond_with Merchant.most_items(params[:quantity])
  end
end
