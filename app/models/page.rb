class Page < ActiveRecord::Base
  belongs_to :menu

	def get_parent
  	(!self.menu.nil?) ? self.menu.name : 'None'
  end
end
