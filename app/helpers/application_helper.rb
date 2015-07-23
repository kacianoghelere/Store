module ApplicationHelper

	# 
	def link_icon(icon, text)
		"<span class='glyphicon glyphicon-#{icon}'></span> #{text}".html_safe
	end
end
