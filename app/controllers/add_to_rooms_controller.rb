class AddToRoomsController < PermissionsController
  before_action :authenticate_user!
  before_action :only_admin
  before_action :user_not_authorized, only: [:destroy]



  # add a user to a room and check if the user is already in the room
  def create
    @room = Room.find(params[:room_id])
    @user = User.find(params[:user_id])
    if @user.rooms.include?(@room)
      render json: { success: false, message: "User already in room" }, status: :unprocessable_entity
    else
      @user.rooms << @room
      @user.save
      @user.update(status: false)
      render json: { success: true, message: "User added to room" }, status: :created
    end
  end

  # remove a user from a room
  def destroy
    @room = Room.find(params[:room_id])
    @user = User.find(params[:user_id])
    if @user.rooms.include?(@room)
      @user.rooms.delete(@room)
      @user.update(status: true)
      render json: { success: true, message: "User removed from room" }, status: :ok
    else
      render json: { success: false, message: "User not in room" }, status: :unprocessable_entity
    end
  end

end
