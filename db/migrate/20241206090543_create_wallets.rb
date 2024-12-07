class CreateWallets < ActiveRecord::Migration[8.0]
  def change
    create_table :wallets do |t|
      t.references :account, foreign_key: { to_table: :accounts }
      t.references :entity, foreign_key: { to_table: :entities }

      t.decimal :balance, precision: 12, scale: 2, null: false, default: 0
      t.index [ :account_id, :entity_id ], unique: true
      t.timestamps
    end
  end
end
