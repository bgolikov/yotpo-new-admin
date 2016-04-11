class Role < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :admin_users_roles
  has_many :admin_users , through: :admin_users_roles
end