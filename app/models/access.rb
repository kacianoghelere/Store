class Access < ActiveRecord::Base
  belongs_to :page
  belongs_to :role
  validates :role_id, presence: true
  validates :page_id, presence: true
end
