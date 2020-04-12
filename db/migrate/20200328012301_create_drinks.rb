class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
      t.int :price_cents
      t.boolean :new
      t.float :discount
      t.references :country_of_origin

      t.timestamps
    end
  end
end
