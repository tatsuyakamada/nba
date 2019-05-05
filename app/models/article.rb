class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4, maximum: 30}, uniqueness: true
  validates :body, presence: true, length: {minimum: 30, maximum: 500}

  scope :open_article, -> do
    now = Time.now
      where("released_at <= ?", now).
      where("expired_at > ?", now)
  end
end
