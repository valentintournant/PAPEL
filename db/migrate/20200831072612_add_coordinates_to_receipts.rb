class AddCoordinatesToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :latitude, :float
    add_column :receipts, :longitude, :float
  end
end
