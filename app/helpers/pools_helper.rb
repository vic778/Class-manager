module PoolsHelper
  # get all users where status is true and their role name
  def all_users_in_pool
    User.where(status: true).map { |user| [user.username, user.email, user.role.name] }
  end
end
