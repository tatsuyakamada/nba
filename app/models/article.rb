class Article < ApplicationRecord
  mount_uploader :article_image, ArticleImageUploader

  belongs_to :member

  validates :title, presence: true, length: {minimum: 4, maximum: 40}, uniqueness: true
  validates :body, presence: true, length: {minimum: 10, maximum: 2000}
  validate :date_check

  def date_check
    errors.add(:expired_at, "の日付を正しく記入してください。") unless
    self.released_at < self.expired_at
  end

  scope :public_article, -> do
    now = Time.now
      where("released_at <= ?", now).
      where("expired_at > ?", now).
      where(member_only: false)
  end

  scope :member_article, -> do
    now = Time.now
      where("released_at <= ?", now).
      where("expired_at > ?", now)
  end

end
