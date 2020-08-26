class Cohort < ApplicationRecord
  has_many :receipts

  validates :title, presence: true
  validates :description, presence: true
end
