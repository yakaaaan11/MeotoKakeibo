class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :families
  has_many :pays
  has_many :incomes
  has_one :deposit
  has_many :budgets
  has_many :categories

end
