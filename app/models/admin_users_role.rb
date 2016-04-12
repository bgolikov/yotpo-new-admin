class AdminUsersRole < ActiveRecord::Base
  validates :admin_user_id, :role_id, presence: true, uniqueness: true
  belongs_to :admin_user
  belongs_to :role
end