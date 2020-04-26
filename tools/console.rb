require_relative '../config/environment.rb'
require "pry"
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
steven = Follower.new("steven", 23, "everything happens for a reason")
kylee = Follower.new("kylee", 22, "i like dogs")
brandon = Follower.new("brandon", 23, "uh")
kristyn = Follower.new("kristyn", 45, "im mom")
greg = Follower.new("greg", 50, "im dad")
ashley = Follower.new("ashley", 29, "nurse")
lynchburg = Cult.new("lynchburg", "va", 1997, "christian")
seattle = Cult.new("seattle", "wa", 1997, "left")
disney_land = Cult.new("disney land", "ca", 1950, "most magical place on earth", 15)
dc = Cult.new("dc", "va", 2000, "capitol")
santa = Cult.new("santa", "la", 2018, "virus")
steven.join_cult(lynchburg)
steven.join_cult(seattle)
santa.recruit_follower(steven)
ashley.join_cult(dc)
ashley.join_cult(lynchburg)
kylee.join_cult(santa)
kylee.join_cult(seattle)
bob = Follower.new("bob", 10, "abc")
bob.join_cult(disney_land)
fred = Follower.new("fred", 6, "hig")
disney_land.recruit_follower(fred)
tod = Follower.new("tod", 22, "werwd")
edd = Follower.new("edd", 43, "eddy boi")
hank = Follower.new("hank", 66, "klm")
george = Follower.new("george", 35, "efg")
binding.pry
santa.cult_population
Cult.find_by_name("lynchburg")
Cult.find_by_location("va")
Cult.find_by_founding_year(1997)
steven.cults
Follower.of_a_certain_age(23)
#all workruby

puts "Mwahahaha!" # just in case pry is buggy and exits
