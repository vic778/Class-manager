# module LOGINUSER 
#   def login_user(user)
#     visit '/api/users/login'
#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password
#     click_button 'Log in'
#   end

# end

def login_user(user)

  @user = User.create(:username => "barh", :email => "rails@gmail.com", :password => "123456", :password_confirmation => "123456")
  post '/api/users/login'

  # fill in sign in form
  within("#main_container") do
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button "Sign in"
  end
end
