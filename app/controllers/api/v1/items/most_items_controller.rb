class Api::V1::Items::MostItemsController < Api::ApiController
  def index
    respond_with Item.most_items(params[:quantity])
  end
end
