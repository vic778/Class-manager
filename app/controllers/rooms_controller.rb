class RoomsController < PermissionsController
  before_action :authenticate_user!
  before_action :only_admin
  before_action :set_room, only: %i[show update destroy]

  def index
    #get all rooms including users
    @rooms = Room.all
    if @rooms
      render json: @rooms, status: :ok
    else
      render json: "[]", status: :no_content
    end
  end

  def show
    @rooms = helpers.render_users_in_room(Room.find(params[:id]))
    if @rooms
      render json: @rooms, status: :ok
    else
      render json: "[]", status: :no_content
    end
  end

  def create
    @room = Room.create(room_params)
    if @room.save
      render json: { success: true, message: "Room created successfully", room: @room }, status: :created
    else
      render json: { success: false, message: "Room not created", errors: @room.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      render json: { success: true, message: "Room updated successfully", room: @room }, status: :created
    else
      render json: { success: false, message: "Room not updated", errors: @room.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    render json: { success: true, message: "Room deleted successfully" }, status: :ok
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.permit(:name, :field, user: [])
  end
end
