ActiveAdmin.register Artist do
  permit_params :name, :born, :died, :nationality, :field, :intro
  index do
    column :name
    column :born
    column :died
    column :nationality
    column :field
    actions
  end
  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :name
      f.input :born
      f.input :died
      f.input :nationality
      f.input :field
      f.input :intro, :as => :ckeditor
    end

    f.actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
