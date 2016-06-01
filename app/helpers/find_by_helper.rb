module FindByHelper
  def self.find_by(params, model)
    if params.keys.include?("id")
      model.find_by(id: params["id"])
    elsif params.keys.include?("name")
      model.find_by(name: params["name"])
    elsif params.keys.include?("created_at")
      model.find_by(created_at: params["created_at"])
    elsif params.keys.include?("updated_at")
      model.find_by(updated_at: params["updated_at"])
    elsif params.keys.include?("customer_id")
      model.find_by(customer_id: params["customer_id"])
    elsif params.keys.include?("merchant_id")
      model.find_by(merchant_id: params["merchant_id"])
    elsif params.keys.include?("status")
      model.find_by(status: params["status"])
    end
  end

  def self.find_all_by(params, model)
    if params.keys.include?("id")
      model.where(id: params["id"])
    elsif params.keys.include?("name")
      model.where(name: params["name"])
    elsif params.keys.include?("created_at")
      model.where(created_at: params["created_at"])
    elsif params.keys.include?("updated_at")
      model.where(updated_at: params["updated_at"])
    elsif params.keys.include?("customer_id")
      model.where(customer_id: params["customer_id"])
    elsif params.keys.include?("merchant_id")
      model.where(merchant_id: params["merchant_id"])
    elsif params.keys.include?("status")
      model.where(status: params["status"])
    end
  end
end
