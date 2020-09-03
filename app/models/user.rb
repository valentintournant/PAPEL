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

  def by_month
    Receipt.all.group_by { |m| m.date.beginning_of_month }
  end

  def total_receipts_per_category(category_name)
    self.receipts.where(category_name: category_name).sum(:amount)
  end

  def total_monthly_receipts_per_category(category_name, month_number)
    month_number = month_number.to_i

    receipts = self.receipts
        .where(category_name: category_name)
        .group_by { |t| t.date.month }[month_number]

    return 0 if receipts.nil?


    return receipts.sum { |receipt| receipt.amount }
  end


  def receipts_per_month
    self.receipts.group_by { |t| t.date.month }
    # Hash => { 8: [Receipt.new, Receipt.new], 9: [Receipt.new, Receipt.new] }
  end

  def receipt_month_numbers
    self.receipts_per_month.keys.sort.reverse
  end

  def receipts_for_specific_month_number(month_number)
    self.receipts_per_month[month_number]
  end

  def current_monthly_receipts
    current_month_number = Time.now.month
    self.receipts_per_month[current_month_number]
  end

  def total_amount_for_specific_month(month_number)
    month_number = month_number.to_i

    receipts = self.receipts_for_specific_month_number(month_number)
    return 0 if receipts.nil?

    return receipts.sum { |receipt| receipt.amount }
  end

  def total_amount_for_current_month
    self.current_monthly_receipts.sum { |receipt| receipt.amount }
  end

end
