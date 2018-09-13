class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :status, default: 0
      t.integer :ticket_quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
