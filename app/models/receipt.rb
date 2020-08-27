class Receipt < ApplicationRecord
  CATEGORIES = {
    'shopping'          => 'Shopping',
    'restaurant'        => 'Restaurant',
    'food_and_beverage' => 'Food and Beverage',
    'entertainment'     => 'Entertainment',
    'transport'         => 'Transports',
    'others'            => 'Others',
  }

  AUTHORIZED_CATEGORIES = CATEGORIES.keys

  belongs_to :user
  belongs_to :cohort, optional: true
  validates :store, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :category_name, inclusion: {in: AUTHORIZED_CATEGORIES }
end
