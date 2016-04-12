class AdminUser < ActiveRecord::Base
  validates :name, :password, presence: true
  has_many :admin_users_roles
  has_many :logs
  has_many :roles, through: :admin_users_roles
  has_many :activity_types, through: :logs


end