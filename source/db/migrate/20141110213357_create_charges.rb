class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.decimal :amount
      t.string :unique_code
      t.boolean :paid
      t.boolean :refunded
      t.string :customer_type
      t.integer :customer_id

      t.timestamps
    end
  end
end
