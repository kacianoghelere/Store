module ApplicationHelper

	def full_title(title)
		title ||= 'Home'
		"#{title} | Store"
	end

	# CUSTOM
	def sidebar_link(icon, text = '', path = '#')
		("<a href='#{path}'>"+
				"<i class='glyphicon glyphicon-#{icon}'></i> #{text}"+
				"</a>").html_safe
	end

	def link_icon(icon, text = '')
		("<span class='glyphicon glyphicon-#{icon}'></span> #{text}").html_safe
	end

	def btn_submit(prepend = '')
		"#{prepend} btn btn-primary btn-sm"
	end

	def btn_create(prepend = '')
		"#{prepend} btn btn-primary btn-sm"
	end

	def btn_show(prepend = '')
		"#{prepend} btn btn-default btn-sm"
	end
	
	def btn_edit(prepend = '')
		"#{prepend} btn btn-info btn-sm"
	end

	def btn_destroy(prepend = '')
		"#{prepend} btn btn-danger btn-sm"
	end
end
