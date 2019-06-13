class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  scope :current_player, -> (team_id) do
    now = Time.now
      where("contract_start <= ?", now).
      where("contract_period > ?", now).
      where("team_id = ? ", team_id)
  end

end
