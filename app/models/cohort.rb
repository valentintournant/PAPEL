class Cohort < ApplicationRecord
  has_many :receipts
  has_many :members, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :members
  # def owner

  # end
end
