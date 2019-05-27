class Member < ApplicationRecord
  has_many :post
  has_many :comment

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

  def full_name
    last_name + " " + first_name
  end

  def full_name_call
    last_name_call + " " + first_name_call
  end


end
