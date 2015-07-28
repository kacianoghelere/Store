class Role < ActiveRecord::Base
	has_many :users
	has_many :accesses
  has_many :pages, through: :accesses
end
