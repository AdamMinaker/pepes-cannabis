ActiveAdmin.register Product do
  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :sku, :price, :description, :image, :stock
  #
  # or
  #
  permit_params do
    permitted = %i[name sku price description image stock category category_id]
    permitted << :other if params[:action] == "create"
    permitted
  end

  index do
    selectable_column
    column "Image" do |product|
      image_tag product.image.variant(:thumb) if product.image.attached?
    end
    column "Name" do |product|
      link_to product.name, admin_product_path(product)
    end
    column :description
    column :category
    column :stock
    column :sku
    column "Price" do |product|
      number_to_currency(product.price.fdiv(100))
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :category
      row :description
      row :sku
      row :stock
      row "Price" do |product|
        number_to_currency(product.price.fdiv(100))
      end
      row :image do |product|
        image_tag product.image.variant(resize_to_fill: [262, 200]) if product.image.attached?
      end
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :category
      f.input :name
      f.input :sku
      f.input :stock
      f.input :price
      f.input :description
    end
    f.inputs "Image" do
      f.file_field :image
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
