class Team < ApplicationRecord
  mount_uploader :team_image, TeamImageUploader

  belongs_to :division
  has_many :team_players
  has_many :players, through: :team_players

  validates :division_id, presence: true
  validates :team_name, presence: true, uniqueness: true
  validates :establishment, presence: true
  validates :home_court, presence: true
  validates :owner, presence: true

end
