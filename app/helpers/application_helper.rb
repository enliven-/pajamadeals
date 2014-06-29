module ApplicationHelper

	def render_date(date, options = {})
		date.strftime("%d %b, %Y")
	end
end
