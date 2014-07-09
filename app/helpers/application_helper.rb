module ApplicationHelper

	def render_date(date, options = {})
		date.strftime("%d %b, %Y")
	end

	def render_field(object, field, or_else = '-')
		object.send(field).present? ? object.send(field) : or_else
	end
end
