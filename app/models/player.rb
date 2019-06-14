class Player < ApplicationRecord
  has_and_belongs_to_many :positions
  has_many :team_players

  def full_name
    first_name + " " + last_name
  end

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  scope :current, -> do
    now = Time.now
      where("contract_start <= ?", now).
      where("contract_period > ?", now)
  end
  
end
