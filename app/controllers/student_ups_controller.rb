class StudentUpsController < PermissionsController
  before_action :authenticate_user!
  before_action :only_student
  before_action :set_student_up, only: %i[show update destroy]

  def index
    @room = Room.find(params[:room_id])
    @home_work = HomeWork.find(params[:home_work_id])
    @student_ups = @home_work.student_ups.all
    render json: @student_ups
    # @student_ups = @room.student_ups.all
    # render json: @student_ups
  end

  def show
    @student_up = helpers.student_name(params[:id])
    render json: @student_up
  end

  def create
    @student_up = StudentUp.create(student_up_params.merge(room_id: params[:room_id], user_id: current_user.id, home_work_id: params[:home_work_id]))
    if @student_up.save
      render json: { status: true, message: "StudentUp created successfully", student_up: @student_up }, status: :created
    else
      render json: @student_up.errors, status: :unprocessable_entity
    end
  end


  private

  def set_student_up
    @room = Room.find(params[:room_id])
    @home_work = HomeWork.find(params[:home_work_id])
    @student_up = @home_work.student_ups.find(params[:id])
    # @student_up = @room.student_ups.find(params[:id])
  end

  def student_up_params
    params.permit(:assignment)
  end
end
