class Team < ApplicationRecord
  mount_uploader :team_image, TeamImageUploader

  belongs_to :division

  validates :division_id, presence: true
  validates :team_name, presence: true, uniqueness: true
  validates :establishment, presence: true
  validates :home_court, presence: true
  validates :owner, presence: true

end
