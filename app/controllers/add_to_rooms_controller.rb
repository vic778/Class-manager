class AddToRoomsController < PermissionsController
  before_action :authenticate_user!
  before_action :user_not_authorized

  def create; end
end
