class Cohort < ApplicationRecord
  has_many :receipts
  has_many :members

  validates :title, presence: true
  validates :description, presence: true

  # def owner

  # end
end
