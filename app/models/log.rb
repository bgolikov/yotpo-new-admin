class Log < ActiveRecord::Base
  validates :activity_type_id, :admin_user_id, presence: true
  belongs_to :admin_user
  belongs_to :activity_type
end