class Category < ApplicationRecord
  has_ancestry
  has_many :pays
  has_many :budgets
  belongs_to :user

end
