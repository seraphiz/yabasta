ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :user, :tag, :content, :date, :period_of_day, :age, :latitude, :longitude, :address, :name, :active

index do
    column :id
    column :tag
    column :user
    column :date
    column :address
    column :name
    column :created_at

    actions
    end

    filter :user
        filter :tag
        filter :address
        filter :name
end
