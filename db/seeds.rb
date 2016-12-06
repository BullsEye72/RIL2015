# Admin default
Admin.create!(
  email:                  'admin@admin.com',
  password:               'admin888',
  password_confirmation:  'admin888'
)

# User default
User.create!(
  email:                  'user@user.com',
  password:               'user8888',
  password_confirmation:  'user8888'
)

# Commercial
commercial = User.new(
    email:                  'commercial@commercial.com',
    password:               'commercial',
    password_confirmation:  'commercial'
)
commercial.add_role :commercial
commercial.save!