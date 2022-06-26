hash = { message: "Thank you for joining class manager app, please check your email and verify your account!" }
json.post do
  json.title "Registration Successful"
  json.merge! hash
end
