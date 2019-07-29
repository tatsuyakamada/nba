class Headcoach < ApplicationRecord
  mount_uploader :headcoach_image, HeadcoachImageUploader

  def full_name
    first_name + " " + last_name
  end

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

end
