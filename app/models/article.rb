class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4, maximum: 30}, uniqueness: true
  validates :body, presence: true, length: {minimum: 30, maximum: 500}
  validate :date_check

  def date_check
    errors.add(:expired_at, "の日付を正しく記入してください。") unless
    self.released_at < self.expired_at
  end

  scope :open_article, -> do
    now = Time.now
      where("released_at <= ?", now).
      where("expired_at > ?", now)
  end
end
