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

# Customers
20.times do
  Customer.create!(
      firstname:    Faker::Name.first_name,
      lastname:     Faker::Name.last_name,
      address:      "#{Faker::Address.street_address},
                     #{Faker::Address.postcode} #{Faker::Address.city}",
      phone_number: "0#{Faker::Number.number(9)}"
  )
end