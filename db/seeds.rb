# require 'faker'

# # create a few users
# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# user_group = []

# 5.times do
#   user = User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
#   user_group << user
# end

# # create a few technical skills
# computer_skills = %w(Ruby Sinatra Rails JavaScript jQuery HTML CSS)
# computer_skills.each do |skill|
#   Skill.create :name => skill, :context => 'technical'
# end

# # create a few creative skills
# design_skills = %w(Photoshop Illustrator Responsive-Design)
# design_skills.each do |skill|
#   Skill.create :name => skill, :context => 'creative'
# end

# # TODO: create associations between users and skills

formal = [true, false]

# user_group.each do |user|
3.times do
  experience = rand(7..10)
  computer_skill = Skill.find(rand(1..10))
  Proficiency.create({:user_id => 8, :skill_id => computer_skill.id,
                      :experience => experience, :formal => formal.sample})
end
