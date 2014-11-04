class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :sum
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
