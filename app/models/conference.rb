class Conference < ApplicationRecord
  has_many :divisions

  validates :conference_name, uniqueness: true

  def division_number
    Division.where("conference_id = ? ", id).count
  end

end
