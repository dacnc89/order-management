class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.integer :total, null: false, default: 0
      t.string :ship_to, null: false, default: ''

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
