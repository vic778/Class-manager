ActiveAdmin.register Room do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :name, :field, :user_id, :class_room_id, :home_work_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :field]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
