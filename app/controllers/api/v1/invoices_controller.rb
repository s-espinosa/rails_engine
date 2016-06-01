class Api::V1::InvoicesController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with FindByHelper.find_by(params, Invoice)
  end

  def find_all
    respond_with FindByHelper.find_all_by(params, Invoice)
  end

  def random
    respond_with Invoice.order("RANDOM()").limit(1).first
  end
end
