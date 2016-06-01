class Api::V1::CustomersController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with FindByHelper.find_by(params, Customer)
  end

  def find_all
    respond_with FindByHelper.find_all_by(params, Customer)
  end

  def random
    respond_with Customer.order("RANDOM()").limit(1).first
  end
end
