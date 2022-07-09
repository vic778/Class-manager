class PoolsController < PermissionsController
  before_action :authenticate_user!
  before_action :user_not_authorized

  def index
    @pools = helpers.get_all_users
    if @pools
      render json: @pools
    else
      render json: { message: "[]" }, status: :unprocessable_entity
    end
  end

end
