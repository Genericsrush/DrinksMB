ActiveAdmin.register Drink do
  permit_params :name, :description, :price, :new, :discount, :country_of_origin_id

end
