# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sherm = Customer.create!(
  first_name: 'Shernman',
  last_name: 'Au',
  email: 'sherman@email.com',
  address: '1234 Somewhere St.'
)
phillip = Customer.create!(
  first_name: 'Phillip',
  last_name: 'Kamps',
  email: 'phillip@email.com',
  address: '3412 Somewhere St.'
)

green = Tea.create!(
  title: 'Green Tea',
  description: 'Organic Japanese Green Tea',
  temperature: 167,
  brew_time: 'Between 1 to 4 minutes'
)
oolong = Tea.create!(
  title: "Uncle Iroh's Oolong",
  description: 'ATL appreciation post',
  temperature: 159,
  brew_time: 'Between 1 to 4 minutes'
)
orange = Tea.create!(
  title: 'Back Tea with Orange',
  description: 'Delicious Breakfast Tea',
  temperature: 190,
  brew_time: 'Between 1 to 4 minutes'
)

sub_1 = Subscription.create(
  customer_id: sherm.id,
  tea_id: green.id,
  title: 'Green Tea Fix',
  price: 12.50,
  frequency: :monthly
)
sub_2 = Subscription.create(
  customer_id: sherm.id,
  tea_id: oolong.id,
  title: 'Uncle Iroh 4 Lyfe',
  price: 16.50,
  frequency: :weekly,
  status: :cancelled
)
sub_3 = Subscription.create(
  customer_id: phillip.id,
  tea_id: oolong.id,
  title: 'Uncle Iroh 4 Lyfe',
  price: 16.50,
  frequency: :weekly,
  status: :active
)
