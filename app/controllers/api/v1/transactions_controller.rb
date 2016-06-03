class Api::V1::TransactionsController < Api::ApiController
  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    respond_with Transaction.find_by(merchant_params)
  end

  def find_all
    respond_with Transaction.where(merchant_params)
  end

  def random
    respond_with Transaction.order("RANDOM()").limit(1).first
  end

  private
  def merchant_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end
