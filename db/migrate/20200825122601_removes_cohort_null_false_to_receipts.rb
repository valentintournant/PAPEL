class RemovesCohortNullFalseToReceipts < ActiveRecord::Migration[6.0]
  def change
    change_column :receipts, :cohort_id, :bigint, null: false
  end
end
