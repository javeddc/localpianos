# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: 'VinceS', email: 'vincent.simmons56@example.com', password: 'burgersburgers', image_url: 'https://randomuser.me/api/portraits/men/83.jpg')

u2 = User.create(username: 'JorgeMelb', email: 'jorge.gregory12@example.com', password: 'burgersburgers', image_url: 'https://randomuser.me/api/portraits/men/68.jpg')

u3 = User.create(username: 'ColleenRoss', email: 'colleen.ross63@example.com', password: 'burgersburgers', image_url: 'https://randomuser.me/api/portraits/women/12.jpg')


p1 = Piano.new(user_id:u3.id, category:'public', latitude: '-37.817124', longitude: '144.966067', location_description:"Upstairs in the Melbourne library, on Flinders Lane.", piano_description:"A Kawai upright, good condition, tuned fairly regularly.", access_description:"Available for public use from 12-2pm, 4-5pm, and 6-7pm. AMEB grade 5 or higher standard expected. Library staff will ask you to stop playing if you're outside these hours or they don't think you're up to scratch!")
p1.save

p2 = Piano.new(user_id:u3.id, category:'public', latitude: '-37.806732', longitude: '144.958823', location_description:"In the food court of Victoria Markets.", piano_description:"An older german upright, in good condition and fairly in tune, if a bit honky-tonk.", access_description:"Available for public playing during the market hours. Staff don't mind what you play. Quite a social space. ")
p2.save

p3 = Piano.new(user_id:u3.id, category:'public', latitude: '-37.810293', longitude: '144.962863', location_description:"In the dining hall of Melbourne Central, on Level 2.", piano_description:"A painted upright, kept pretty tuned and maintained.", access_description:"Available 5-9pm Thursday and Friday and 12-4pm weekends. Usually locked. You need to ask customer service to open it – they are on Level 1 opposite GAP.")
p3.save

ph1 = PianoPhoto.create(piano_id:p1.id, image_url:'https://i.ytimg.com/vi/83r3UQfW4PA/maxresdefault.jpg')

ph2 = PianoPhoto.create(piano_id:p2.id, image_url:'https://www.melbournecentral.com.au/getmedia/9514e301-4cda-462d-9062-12088ece8699/10658806-10153023229447200-851804534656990888-o?width=350&height=232')

ph3 = PianoPhoto.create(piano_id:p3.id, image_url:'https://preview.ibb.co/kn6FEk/Screen_Shot_2017_07_24_at_5_00_36_pm.jpg')
