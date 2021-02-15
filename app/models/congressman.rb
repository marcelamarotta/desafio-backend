class Congressman < ApplicationRecord
  has_many :expenses
  validates :name, uniqueness: true
end
