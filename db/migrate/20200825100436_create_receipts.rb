class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :title
      t.date :date
      t.string :store
      t.integer :amount
      t.text :description
      t.string :category_name
      t.references :user, null: false, foreign_key: true
      t.references :cohort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
