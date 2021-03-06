class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :member

  validates :body, presence: true, length: { maximum: 140 }
  validates :member_id, presence: true
  validates :post_id, presence: true
  validates :member_id, uniqueness: { message: 'すでにコメントが登録されています。', scope: [:post_id] }
end
