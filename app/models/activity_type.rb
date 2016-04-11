class ActivityType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :logs
  has_many :admin_users, through: :logs
end