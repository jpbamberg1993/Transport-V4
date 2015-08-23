module ApplicationHelper

  def carrier_list
    carrier_list = []
    carrier_list << User.where(role: 'carrier').each
  end

  def shipper?
    current_user.role == "shipper"
  end

  def carrier?
    current_user.role == "carrier"
  end

  def full_title(page_title = '')
    base_title = "Transportation Procurement"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
