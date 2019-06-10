class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  scope :current_player, -> do
    now = Time.now
      where("contract_start <= ?", now).
      where("contract_period > ?", now).
      where("team_id　= ? ", 1)
  end

end
