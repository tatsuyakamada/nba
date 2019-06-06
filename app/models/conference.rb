class Conference < ApplicationRecord
  has_many :divisions

  validates :conference_name, uniqueness: true

end
