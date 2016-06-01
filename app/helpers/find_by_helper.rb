module FindByHelper
  def self.find_by(params, model)
    if params.keys.include?("id")
      model.find_by(id: params["id"])
    elsif params.keys.include?("name")
      model.find_by(name: params["name"])
    elsif params.keys.include?("created_at")
      model.find_by(created_at: params["created_at"])
    else
      model.find_by(updated_at: params["updated_at"])
    end
  end

  def self.find_all_by(params, model)
    if params.keys.include?("id")
      model.where(id: params["id"])
    elsif params.keys.include?("name")
      model.where(name: params["name"])
    elsif params.keys.include?("created_at")
      model.where(created_at: params["created_at"])
    else
      model.where(updated_at: params["updated_at"])
    end
  end
end
