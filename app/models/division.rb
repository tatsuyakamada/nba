class Division < ApplicationRecord
  belongs_to :conference

  validates :conference_id, presence: true
  validates :division_name, presence: true, uniqueness: true

end
