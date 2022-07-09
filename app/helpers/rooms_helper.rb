module RoomsHelper
  # render all users where the role name is student in a room and his role name
  def render_users_in_room(room)
    # room.users.where(role_id: Role.find_by(name: 'student').id).pluck(:username, :email)
    room.users.where(role_id: Role.find_by(name: 'student').id).map { |user| [user.username, user.email, user.role] }
  end
end
