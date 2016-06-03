class Api::V1::Merchants::CustomersPendingInvoicesController < Api::ApiController
  def index
    respond_with Merchant.customers_pending_invoices(params[:id])
  end
end
