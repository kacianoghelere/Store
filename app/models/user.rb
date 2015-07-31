class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :items
  validates_presence_of :name
  validates :role_id, presence: true
	before_save :assign_role

  def first_name
    self.name.split(" ")[0]
  end

	def assign_role
	  self.role ||= Role.find_by(admin: false, manager: false).take(1) 
	end

  def admin?
    self.role.admin?
  end

  def manager?
    self.role.manager?
  end

  def regular?
    !self.role.admin? && self.role.manager?
  end
  def last_login
    self.current_sign_in_at.to_formatted_s(:last_login)
  end
end
