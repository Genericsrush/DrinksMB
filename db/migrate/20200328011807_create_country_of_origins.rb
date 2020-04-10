class CreateCountryOfOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :country_of_origins do |t|
      t.string :name
      t.string :abbreviation
      t.references :drink

      t.timestamps
    end
  end
end
