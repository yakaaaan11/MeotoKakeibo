class Family < ApplicationRecord
  attachment :image, destroy: false
  has_many :pays
  has_many :incomes
  belongs_to :user
end
