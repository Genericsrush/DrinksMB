class CreateOrderedDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_drinks do |t|
      t.reference :order
      t.reference :drink
      t.int :quantity
      t.float :price

      t.timestamps
    end
  end
end
