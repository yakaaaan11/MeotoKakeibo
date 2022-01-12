class Pay < ApplicationRecord
  belongs_to :category
  belongs_to :family
  belongs_to :user

  def start_time
    self.date
  end

end
