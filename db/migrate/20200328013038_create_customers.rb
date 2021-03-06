class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.references :city
      t.references :province
      t.string :phoneNumber
      t.string :email

      t.timestamps
    end
  end
end
