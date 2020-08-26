class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receipts
  has_many :members
  has_many :cohorts, through: :members

  validates :name, presence: true
  has_one_attached :avatar

  validates :name, presence: true
  has_one_attached :avatar

  def total_receipts
    self.receipts.sum(:amount)
  end

  def total_receipts_per_category(category_name)
    self.receipts.where(category_name: category_name).sum(:amount)
  end

  # def percentage_per_category
  #   total_receipts_per_category * 100 / total_receipts
  # end
end
