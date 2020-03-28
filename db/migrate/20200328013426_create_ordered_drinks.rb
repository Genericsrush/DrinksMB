class CreateOrderedDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_drinks do |t|
      t.references :order
      t.references :drink
      t.numeric :quantity
      t.float :price

      t.timestamps
    end
  end
end
