require 'faker'
require 'as-duration'
User.destroy_all
Attendance.destroy_all
Event.destroy_all

5.times do 
  @user = User.create(first_name: Faker::FunnyName.name, last_name: Faker::FunnyName.two_word_name, email: "#{Faker::Nation.nationality}@yopmail.com", description: "bammss t bo")
  @Attendance = Attendance.create(stripe_customer_id: rand(100..200), event: Event.all.sample, attendant: User.all.sample)
  @event = Event.create(start_date:Faker::Time.forward(23), duration: 45, title:  Faker::DragonBall.character,
          description: Faker::BojackHorseman.tongue_twister, price: 100,
          location: Faker::Address.state, admin: User.all.sample)
end