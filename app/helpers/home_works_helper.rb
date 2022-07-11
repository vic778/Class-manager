module HomeWorksHelper
    #get the name of the teacher who created the home work
    def teacher_name(id)
        @room = Room.find(params[:room_id])
        @home_work = @room.home_works.find(params[:id])
        @teacher = User.find(@home_work.user_id)
        # HomeWork.find(id).user.username
        
    end
end
