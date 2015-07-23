module ApplicationHelper

	# 
	def link_icon(icon, text)
		"<span class='glyphicon glyphicon-#{icon}'></span> #{text}".html_safe
	end

	def btn_submit
		"btn btn-primary btn-md"
	end

	def btn_create
		"btn btn-primary btn-sm"
	end

	def btn_show
		"btn btn-default btn-sm"
	end
	
	def btn_edit
		"btn btn-info btn-sm"
	end

	def btn_destroy
		"btn btn-danger btn-sm"
	end
end
