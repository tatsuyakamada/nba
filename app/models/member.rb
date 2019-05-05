class Member < ApplicationRecord
  has_secure_password validations: true

  validates :last_name, presence: true, length: {maximum: 6}
  validates :first_name, presence: true, length: {maximum: 6}
  validates :last_name_call, presence: true, length: {maximum: 10}
  validates :first_name_call, presence: true, length: {maximum: 10}
  validates :email, presence: true, uniqueness: true
end
