class Api::V1::CustomersController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    respond_with Customer.order("RANDOM()").limit(1).first
  end

  private
  def customer_params
    params.permit(:id, :name, :first_name, :last_name, :created_at, :updated_at)
  end
end
