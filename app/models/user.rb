class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receipts
  has_many :cohorts, dependent: :destroy

  def total_receipts
    self.receipts.sum(:amount)
  end

  def total_receipts_per_category(category_name)
    self.receipts.where(category_name: category_name).sum(:amount)
  end


end

