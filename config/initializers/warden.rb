# sets the cookie for the signed in user, and makes it available for the find current user method defined in connection
Warden::Manager.after_set_user do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = user.id
end
# clears out the cookie when the user signs out
Warden::Manager.before_logout do |_user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = nil
end
