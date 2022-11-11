ActiveAdmin.register Contact do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :email, :phone, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :email, :phone, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu priority: 6
  menu label: "Contact Page"
  config.filters = false

  index do
    column :title
    column :content
    column :email
    column :phone
    column :address
    actions
  end
end
