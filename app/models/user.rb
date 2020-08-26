class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receipts
  has_many :members
  has_many :cohorts, through: :members
  validates :name, presence: true
  has_one_attached :avatar
end
