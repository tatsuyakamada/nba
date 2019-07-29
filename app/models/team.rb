class Team < ApplicationRecord
  mount_uploader :team_image, TeamImageUploader

  belongs_to :division
  has_many :team_players
  has_many :players, through: :team_players
  has_many :home_team_schedules, class_name: 'Schedule', :foreign_key => 'home_team_id'
  has_many :away_team_schedules, class_name: 'Schedule', :foreign_key => 'away_team_id'

  validates :division_id, presence: true
  validates :team_name, presence: true, uniqueness: true
  validates :establishment, presence: true
  validates :home_court, presence: true
  validates :owner, presence: true

  def current_player_number
    TeamPlayer.where("contract_start <= ?", Time.now).
               where("contract_period > ?", Time.now).
               where("team_id = ? ", id).
               count
  end

  def home_court_select
    home_court + " <" + team_name + ">"
  end

end
