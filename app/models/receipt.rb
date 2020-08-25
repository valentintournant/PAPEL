class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :cohort, optional: true
end
