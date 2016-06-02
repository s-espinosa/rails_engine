class Api::V1::InvoiceItemsController < Api::ApiController
  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.find_by(invoice_params)
  end

  def find_all
    respond_with InvoiceItem.where(invoice_params)
  end

  def random
    respond_with InvoiceItem.order("RANDOM()").limit(1).first
  end

  private
  def invoice_params
    if params.keys.include?("unit_price")
      {unit_price: (params[:unit_price].to_f * 100).to_i}
    else
      params.permit(:id, :invoice_id, :item_id, :quantity, :created_at, :updated_at)
    end
  end
end
