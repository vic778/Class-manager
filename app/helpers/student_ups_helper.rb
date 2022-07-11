module StudentUpsHelper

    def student_name(id)
        @room = Room.find(params[:room_id])
        @home_work = @room.home_works.find(params[:id])
        @student_up = @home_work.student_ups.find(id)
        @student = User.find(@student_up.user_id)

        # @student_up = StudentUp.find(id)
        # @student_up.user.username
    end
end
