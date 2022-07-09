class AddToRoomsController < PermissionsController
  before_action :authenticate_user!
  before_action :user_not_authorized

  # add a user to a room and check if the user is already in the room
  def create
    @room = Room.find(params[:room_id])
    @user = User.find(params[:user_id])
    if @user.rooms.include?(@room)
      render json: { success: false, message: "User already in room" }, status: :unprocessable_entity
    else
      @user.rooms << @room
      render json: { success: true, message: "User added to room" }, status: :created
    end
  end
end
