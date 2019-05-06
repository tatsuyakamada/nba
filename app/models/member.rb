class Member < ApplicationRecord

  validates :last_name, presence: true, length: {maximum: 6}
  validates :first_name, presence: true, length: {maximum: 6}
  validates :last_name_call, presence: true, length: {maximum: 10}
  validates :first_name_call, presence: true, length: {maximum: 10}
  validates :email, presence: true, uniqueness: true

  has_secure_password validations: true

  def password_correct
    errors.add(:password_confirmation, "パスワードとパスワード（確認）が一致しません") unless
      self.password == self.password_confirmation
    end

end
