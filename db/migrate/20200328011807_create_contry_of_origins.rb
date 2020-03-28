class CreateContryOfOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :contry_of_origins do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
