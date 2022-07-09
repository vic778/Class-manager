class PoolsController < PermissionsController
  before_action :authenticate_user!
  before_action :user_not_authorized

  def index
    @pools = helpers.all_users_in_pool
    if @pools
      render json: @pools
    else
      render json: { message: "[]" }, status: :unprocessable_entity
    end
  end
end
