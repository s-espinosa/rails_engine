class Api::V1::ItemsController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.find_by(item_params)
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    respond_with Item.order("RANDOM()").limit(1).first
  end

  private
  def item_params
    if params.keys.include?("unit_price")
      {unit_price: (params[:unit_price].to_f * 100).to_i}
    else
      params.permit(:id, :name, :description, :merchant_id, :created_at, :updated_at)
    end
  end
end
