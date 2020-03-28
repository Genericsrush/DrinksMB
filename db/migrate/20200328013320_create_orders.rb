class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer
      t.float :total_cost
      t.float :gst
      t.float :pst
      t.float :hst

      t.timestamps
    end
  end
end
