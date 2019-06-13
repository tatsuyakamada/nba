class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def full_name
    player.first_name + " " + player.last_name
  end

end
