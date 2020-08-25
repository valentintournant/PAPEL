class Cohort < ApplicationRecord
  belongs_to :user
  has_many :receipts

  validates :title, presence: true
  validates :description, presence: true
end
