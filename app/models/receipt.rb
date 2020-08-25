class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :cohort, optional: true
  validates :store, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :category_name, presence: true
end
