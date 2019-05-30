class Post < ApplicationRecord
  belongs_to :member
  has_many :comment

  validates :title, presence: true, length: {minimum: 4, maximum: 40}
  validates :body, presence: true, length: {minimum: 10, maximum: 2000}

  scope :open_post, -> do
    now = Time.now
      where(member_only: false)
  end

  scope :written_post, -> do
    where(member_id: @member)
  end

end
