class Api::V1::TransactionsController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    respond_with Transaction.find_by(customer_params)
  end

  def find_all
    respond_with Transaction.where(customer_params)
  end

  def random
    respond_with Transaction.order("RANDOM()").limit(1).first
  end

  private
  def customer_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end
