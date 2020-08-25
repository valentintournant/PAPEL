class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receipts
  has_many :cohorts, dependent: :destroy
end
