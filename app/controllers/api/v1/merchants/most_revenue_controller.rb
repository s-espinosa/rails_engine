class Api::V1::Merchants::MostRevenueController < Api::ApiController
  def index
    respond_with Merchant.joins(:invoice_items).group(:id).order('sum(invoice_items.quantity*invoice_items.unit_price) DESC').limit("#{params[:quantity]}")
  end
end
