class RoleAccess < ActiveRecord::Base
	has_and_belongs_to_many :roles
	has_and_belongs_to_many :pages
	validates  :role_id, presence: true
	validates  :page_id, presence: true
end
