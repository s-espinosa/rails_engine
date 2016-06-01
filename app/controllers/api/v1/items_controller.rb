class Api::V1::ItemsController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with FindByHelper.find_by(params, Item)
  end

  def find_all
    respond_with FindByHelper.find_all_by(params, Item)
  end

  def random
    respond_with Item.order("RANDOM()").limit(1).first
  end
end
