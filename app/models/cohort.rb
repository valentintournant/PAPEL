class Cohort < ApplicationRecord
  has_many :receipts
  has_many :members, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3, maximum: 20}, allow_blank: false
  validates :description, presence: true
  accepts_nested_attributes_for :members
  def owner
    member = self.members.find {|member| member.status == "owner"}
    return member.user
  end
end
