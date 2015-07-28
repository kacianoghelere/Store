module ApplicationHelper
	require 'json'

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

	def str_to_sym(string)
		string.gsub(/\s+/,"_").downcase.to_sym
	end

	def user_navigation
		return build_hash(get_hash)
	end

	private

		def build_hash(hash)			
			html = ''
			hash.each do |key, value|
				if key == :pages
					if !hash[:pages].empty?
						hash[:pages].each do |page|
							html += "<li>" 
							html += sidebar_link( page.icon, page.name, send(page.path)) 
							html += "</li>"
						end
					end
				end
			end

			hash.each do |key, value|
				if key != :icon && key != :pages
					html += '<li data-toggle="collapse" data-target="#management" class="collapsed">'
          html += sidebar_link('wrench', 'Management')
          #Inicia processo de recurssão
					html += build_hash(hash[key])				
        	html += '</li>'
				end
			end

			return html.html_safe
		end

		# Construtor do hash de menus
		def get_hash
			hash = {}
		
			# Recupera as paginas que não pertencem a nenhum menu especifico,
			# mas pertencem ao perfil do usuario atual
			loose = []
			acc = "SELECT page_id FROM accesses WHERE role_id = :role_id"
			pages = Page.where("id IN (#{acc}) AND menu_id IS NULL", 
													role_id: current_user.role.id)
			pages.each do |page|					
				loose.push(page)
			end
			# Adiciona o array de paginas avulsas no hash
			hash[:pages] = loose

			# Percorre todos os menus
			Menu.where(parent_id: nil).each do |menu|
				# Inicia o processo recursivo de construção
				build_menu_hash(hash, menu)
			end

			return hash
		end

		# Método recursivo de contrução de menus
		def build_menu_hash(hash, menu)
			sym = str_to_sym(menu.name) # Conversão do nome do menu em simbolo
			# Inicializa o hash do menu, utilizando o nome como chave
			hash[sym] = {}
			hash[sym][:icon] = menu.icon
			# Verifica se o menu possui menus filhos
			if !menu.children.empty?
				# Percorre os menus filhos
				menu.children.each do |child|
					build_menu_hash(hash[sym], child)
				end
			end

			# Busca todas as telas do menu liberadas para o perfil do usuário atual
			acc = "SELECT page_id FROM accesses WHERE role_id = :role_id"
			pages = menu.pages.where("id IN (#{acc})", role_id: current_user.role.id)

			# Se houverem paginas, inicia a montagem
			if !pages.empty?
				arr = []
				# Percorre as paginas encontradas e adiciona no hash de menus
				# usando o nome do menu como chave 
				pages.each do |page|					
					arr.push(page)
				end
				hash[sym][:pages] = arr
			end
		end
end
