module ApplicationHelper

	def render_date(date, options = {})
		date.strftime("%d %b")
	end

	def render_field(object, field, or_else = '-')
		object.send(field).present? ? object.send(field) : or_else
	end
 
  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-danger"
      when "notice"
        "alert-success"
      else
        flash_type.to_s
    end
  end
 

end
