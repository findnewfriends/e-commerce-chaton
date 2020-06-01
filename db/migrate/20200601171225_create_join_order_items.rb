class CreateJoinOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :join_order_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
