require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Example classes
mark = Follower.new("Mark", 26)
dan = Follower.new("Dan", 5034)
f3 = Follower.new("3", rand(100))
f4 = Follower.new("4", rand(100))
f5 = Follower.new("5", rand(100))
f6 = Follower.new("6", rand(100))
f7 = Follower.new("7", rand(100))
f8 = Follower.new("8", rand(100))
f9 = Follower.new("9", rand(100))
f10 = Follower.new("10", rand(100))
f11 = Follower.new("11", rand(100))
f12 = Follower.new("12", rand(100))


bloods = Cult.new("Bloods", "USA")
crips = Cult.new("Crip", "USA")
vampires = Cult.new("Vamps", "France")

bloods.recruit_follower(mark)
dan.join_cult(vampires)
mark.join_cult(crips)
f3.join_cult(crips)
f4.join_cult(crips)
f5.join_cult(crips)
f6.join_cult(crips)
f7.join_cult(crips)
f8.join_cult(crips)
f9.join_cult(crips)
f10.join_cult(crips)
f11.join_cult(crips)
f12.join_cult(crips)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
