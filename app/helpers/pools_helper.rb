module PoolsHelper
 
  #get all users where status is true and their role name
  def get_all_users
    User.where(status: true).map { |user| [user.username, user.email, user.role.name] }
  end
end
