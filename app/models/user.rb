class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receipts
  has_many :cohorts, dependent: :destroy
  validates :name, presence: true
  has_one_attached :avatar
end
