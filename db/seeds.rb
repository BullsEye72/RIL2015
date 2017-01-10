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


200.times do
  # Customers
  Customer.create!(
      firstname:    Faker::Name.first_name,
      lastname:     Faker::Name.last_name,
      address:      "#{Faker::Address.street_address},
                     #{Faker::Address.postcode} #{Faker::Address.city}",
      phone_number: "0#{Faker::Number.number(9)}"
  )
  
  # Projects
  Project.create!(
      description:    'Projet test',
      customer:     Customer.last
  )
end

# PaymentStates
payment_states = [
    'a facturer',
    'facturer',
    'payé'
]
payment_states.each {|ps| PaymentState.create!(name:  ps) }

construction_states = [
    { name: 'Devis signé', value: 0.03},
    { name: 'Permis de construire obtenu', value: 0.1},
    { name: 'Chantier ouvert', value: 0.15},
    { name: 'Fondations achevées', value: 0.25},
    { name: 'Mur achevé', value: 0.4},
    { name: "Mis hors d'eau/ hors d'air", value: 0.75},
    { name: 'Travaux achevés', value: 0.95},
    { name: 'Clef remises', value: 1},
]
construction_states.each {|cs| ConstructionState.create! cs }
