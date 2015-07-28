module ApplicationHelper

	def full_title(title)
		title ||= 'Home'
		if title.empty? || title.blank? 
			title = 'Home'
		end
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

	def btn_login(prepend = '')
		"#{prepend} btn btn-block btn-success"
	end

	def btn_signup(prepend = '')
		"#{prepend} btn btn-block btn-primary"
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

	def user_navigation
		@navigation = Hash.new
    accesses = "SELECT page_id FROM role_accesses WHERE role_id = :role_id"
    Page.where("page_id IN (#{accesses})", role_id: current_user.role)
	end
end
