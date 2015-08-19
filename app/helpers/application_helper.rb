module ApplicationHelper

  def shipper?
    current_user.role == "shipper"
  end

  def carrier?
    current_user.role == "carrier"
  end

end
