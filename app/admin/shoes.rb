ActiveAdmin.register Shoe do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Create new shoe' do |f|
    inputs 'Shoe' do
      input :thumbnail, as: :file
      input :name
      input :price
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    
    para "Press cancel to return to the list without saving."
    actions
  end


  permit_params :thumbnail, :name, :price
  
end
