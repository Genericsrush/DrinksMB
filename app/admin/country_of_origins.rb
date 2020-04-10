ActiveAdmin.register CountryOfOrigin do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :abbreviation, drink_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :abbreviation
    column :drinks do |article|
      table_for article.drinks.order('name ASC') do
        column do |drink|
          drink.name
        end
       end
    end
  end

  show do
    attributes_table do
      row :name
      row :abbreviation
      row :drinks do |article|
      table_for article.drinks.order('name ASC') do
        column do |drink|
          link_to drink.name, [ :admin, drink ]
        end
      end
      end
    end
  end

  form do |f|
    f.inputs "Add/Edit Article" do
      f.input :name
      f.input :abbreviation
      f.input :drinks, :as => :check_boxes
    end
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :abbreviation, :drink_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
