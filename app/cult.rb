require "date"
class Cult
    attr_reader :name, :location, :founding_year
    attr_accessor :slogan, :minimum_age

    @@all = []


    def initialize(name, location, minimum_age = 50)
        @name = name
        @location = location
        @founding_year = Date.today.year
        @minimum_age = minimum_age
        self.class.all.push(self)
        
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(follower,self)
            "Follower #{follower.name} have been added to cult #{self.name}"
        else
            "Sorry, follower #{follower.name} does not meet the minimum age requirement of #{self.minimum_age} for cult #{self.name}."
        end
    end

    def cult_population
        BloodOath.all.select{|instance| instance.cult == self}.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        BloodOath.all.find{|blood_oath| blood_oath.cult.name == cult_name}
    end

    def self.find_by_location(cult_location)
        BloodOath.all.select{|blood_oath| blood_oath.cult.location == cult_location}
    end

    def self.find_by_founding_year(founding_year)
        BloodOath.all.select{|blood_oath| blood_oath.cult.founding_year == founding_year}
    end

    def cult_members
        BloodOath.all.select{|blood_oath| blood_oath.cult == self}.map{|blood_oath| blood_oath.follower}
    end

    def average_age
        cult_members.sum { |follower| follower.age }/cult_members.count
    end
    
    def my_followers_mottos
        cult_members.map{|follower| follower.life_motto}
    end

    def self.least_popular
        self.all.min { |cult| cult.cult_population }
    end

    def self.most_common_location
        # Note: Unable to  use tally enumerable as its is in Ruby 2.7 and we are on 2.6
        # Group all cults by location in a hash
        x = self.all.group_by{|cult| cult.location}
        # Map cults object in each key to a count
        x = x.map{|location,cults| {location  => cults.count}}
        # Return max location hash by count in a hash
        x = x.max_by{|location_hash| location_hash.values}
        # Convert single key hash to array, pull first array, and first value which is the location
        x.to_a.first.first
    end
 
end