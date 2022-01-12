class Income < ApplicationRecord
  belongs_to :user
  belongs_to :family

  def start_time
    self.date
  end
end
