class HomeWorksController < PermissionsController
  before_action :authenticate_user!
  before_action :user_not_authorized
  before_action :set_home_work, only: %i[update destroy]

  def index
    @room = Room.find(params[:room_id])
    @home_works = @room.home_works.all
    render json: @home_works
  end

  def show
    @home_work = helpers.teacher_name(params[:id])
    render json: @home_work
  end

  def create
    @home_work = HomeWork.create(home_work_params.merge(room_id: params[:room_id], user_id: current_user.id))
    if @home_work.save
      render json: { status: true, message: "Homework created successfully", home_work: @home_work }, status: :created
    else
      render json: @home_work.errors, status: :unprocessable_entity
    end
  end

  def update
    if @home_work.update(home_work_params)
      render json: { success: true, message: "Homework updated successfully", home_work: @home_work }
    else
      render json: @home_work.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @home_work.destroy
      render json: { success: true, message: "Homework deleted successfully" }
    else
      render json: @home_work.errors, status: :unprocessable_entity
    end
  end

  private

  def set_home_work
    @room = Room.find(params[:room_id])
    @home_work = @room.home_works.find(params[:id])
  end

  def home_work_params
    params.permit(:description, :assignment, :course_name)
  end
end
