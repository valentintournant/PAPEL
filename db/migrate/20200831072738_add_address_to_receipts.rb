class AddAddressToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :address, :string
  end
end
