class PoolsController < PermissionsController
    before_action :authenticate_user!
    before_action :user_not_authorized

    def index
        @pools = User.all
        if @pools 
            render json: @pools
        else
            render json: { message: "[]" }, status: :unprocessable_entity
        end
    end

    def show
        @pool = User.find(params[:id])
        if @pool
            render json: @pool
        else
            render json: { message: "[]" }, status: :unprocessable_entity
        end
    end
    
end
