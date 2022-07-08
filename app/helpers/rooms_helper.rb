module RoomsHelper
    #render all users where the role name is student in a room
    def render_users_in_room(room)
        room.users.where(role_id: Role.find_by(name: 'student').id).pluck(:username, :id, :email)
    end
end
