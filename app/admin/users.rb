ActiveAdmin.register User do
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

permit_params :username, :name, :email, :birthdate, :genre, :active, :role, :password

index do
    column :id
    column :username
    column :name
    column :email
    column :role
    column :created_at
    column :genre
    actions
    end

    form do |f|
        inputs 'Agregar nuevo usuario' do
        input :username
        input :name
        input :birthdate
        input :email
        input :password
        input :active
        input :role
        input :genre
        end 
        actions
        end

controller do
        def update
            if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
                params[:user].delete('password')
                    params[:user].delete('password_confirmation')
                end 
                    
        
                super 
            end 
        end
        filter :username
        filter :email
        filter :name

end

