class Cohort < ApplicationRecord
  belongs_to :user
  has_many :receipts
end
