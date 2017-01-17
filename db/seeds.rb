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

# Achats
purchaser = User.new(
    email:                  'purchaser@purchaser.com',
    password:               'purchaser',
    password_confirmation:  'purchaser'
)
commercial.add_role :purchaser
commercial.save!

# PaymentStates
[
  'A facturer',
  'Facturé',
  'Payé'
].each {|ps| PaymentState.create!(name:  ps) }

# ConstructionStates
[
    { name: 'Devis signé', value: 0.03},
    { name: 'Permis de construire obtenu', value: 0.1},
    { name: 'Chantier ouvert', value: 0.15},
    { name: 'Fondations achevées', value: 0.25},
    { name: 'Mur achevé', value: 0.4},
    { name: "Mis hors d'eau/ hors d'air", value: 0.75},
    { name: 'Travaux achevés', value: 0.95},
    { name: 'Clef remises', value: 1},
].each {|cs| ConstructionState.create! cs }

# VAT
[
  { name: 'Taux normal', value: 20.0},
  { name: 'Taux réduit', value: 5.5}
].each {|cs| ValueAddedTax.create! cs }

# Article_Groups
[
  { name: 'Montants', description: 'Montants en bois pour la structure, nommés lisses ou contrefort' , article_group_id: nil},
  { name: 'Montage', description: 'Eléments de montages, sabots métalliques, boulons, gougeons' , article_group_id: nil},
  { name: 'Panneaux 1', description: 'Panneaux d’isolation et pare-pluie ' , article_group_id: nil},
  { name: 'Panneaux 2', description: "Panneaux intermédiaires et de couverture (intérieur ou extérieur)" , article_group_id: nil},
  { name: 'Plancher', description: '' , article_group_id: nil},
  { name: 'Couverture', description: '' , article_group_id: nil}
].each {|cs| ArticleGroup.create! cs }

# QuoteStates
%w(
 brouillon
  accepté
  en\ attente
  refusé
  en\ commande
  transfert\ en\ facturation
).each { |qs| QuoteState.create! name: qs}


# =================== DONNEES FICTIVES POUR TESTER L'AFFICHAGE ==========================

# Customers & Projects
10.times do
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

# Suppliers & Articles
10.times do
  # Suppliers
  Supplier.create!(
      name:    Faker::Company.suffix + " " + Faker::Company.name,
      phone_number:     "0#{Faker::Number.number(9)}",
      siret:      Faker::Company.swedish_organisation_number,
      fax_number: "0#{Faker::Number.number(9)}"
  )
  
  # Articles
  rand(20).times do
    Article.create!(
      name: Faker::Commerce.product_name,
      value_added_tax_id: 1,
      reference: Faker::Code.asin,
      description: Faker::Lorem.paragraph(3)
    ) 
    
    ArticleSupplier.create!(
      supplier_id: Supplier.last.id,
      article_id: Article.last.id,
      supplier_reference: Faker::Lorem.characters(rand(5..10)).upcase,
      price: rand(0.5..3000.0).round(2)
      )
  end
end