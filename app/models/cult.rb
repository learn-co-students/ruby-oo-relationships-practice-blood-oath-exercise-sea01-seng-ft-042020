class Cult
    attr_accessor :name, :location, :slogan, :minimum_age
    attr_reader :founding_year
    
    @@all = []
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = 18
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end


    def recruit_follower(follower)
        if follower.age > @minimum_age
            BloodOath.new(self, follower, Time.new.strftime("%Y/%m/%d"))
        else
            "We're Sorry. You do not meet the minimum age requirements to join this cult. Have a good one."
        end

    end

    def my_bloodoaths
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def my_followers
        self.my_bloodoaths.map {|oath| oath.follower}
    end

    def cult_population
        self.my_bloodoaths.count
    end

    def average_age
       ages = self.my_bloodoaths.map {|oath| oath.follower.age}
       ages.sum(0.0) / ages.size
    end

    def my_followers_mottos
        self.my_bloodoaths.map {|oath| oath.follower.life_motto}
    end

    def self.least_popular
        # follows = @@all.map {|cult| cult.number_of_followers}
        @@all.min_by {|cult| cult.cult_population }
    end


    def self.find_by_name(name)
        Cult.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        Cult.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.select {|cult| cult.founding_year == year}
    end

    # def self.cult_locations
    #     @@all.map {|cult| cult.location}
    # end

    def self.most_common_location
        cult_locations = @@all.map {|cult| cult.location}
        cult_locations.max_by {|location| cult_locations.count(location)}
    end

end
