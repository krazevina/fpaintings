ActiveAdmin.register Painting do
  permit_params :title, :artist_id, :body, :year, :material, :location, :image, :category_id
  index do
    column :title
    column :artist
    column :material
    column :location
    column :category
  actions
  end
  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :title
      f.input :artist
      f.input :body, :as => :ckeditor
      f.input :year
      f.input :material
      f.input :location
      f.input :image, :as => :file
      f.input :category
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
