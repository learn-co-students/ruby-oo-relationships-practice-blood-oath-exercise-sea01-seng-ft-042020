require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

f1 = Follower.new("Tim", 24, "I love it")
f2 = Follower.new("Jim", 23, "You love it")
f3 = Follower.new("Todd", 45, "We love it")
f4 = Follower.new("Little Bill", 16, "Love trucks!!")

c1 = Cult.new("The Dougies", "Seattle", 1974, "Join us!")
c2 = Cult.new("Savory Alliance", "Dallas", 1979, "Delicious!")
c3 = Cult.new("Operation Bug", "Seattle", 1975, "Bug! Bug! Bug!")

c1.recruit_follower(f2)
c1.recruit_follower(f1)
c2.recruit_follower(f3)
c2.recruit_follower(f1)
c3.recruit_follower(f3)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
