class Conference < ApplicationRecord
  has_many :divisions
  has_many :teams, through: :divisions

  validates :conference_name, uniqueness: true

  def division_number
    Division.where("conference_id = ? ", id).count
  end

  def team_number
    Team.joins({:division => :conference}).where("conference_id = ?", id).count
  end

end
