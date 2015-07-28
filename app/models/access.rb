class Access < ActiveRecord::Base
  belongs_to :page
  belongs_to :role
end
