class Page < ActiveRecord::Base
	belongs_to :menu
	has_many :accesses
	has_many :roles, through: :accesses

	def get_parent
		(!self.menu.nil?) ? self.menu.name : 'None'
	end
end
