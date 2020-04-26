class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year.to_i
        @slogan = slogan
        save
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def cult_population
        cult_oaths.count
    end

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select {|cult| cult.founding_year == year}
    end

    def cult_oaths
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def followers
        cult_oaths.map {|oath| oath.follower}
    end

    def followers_ages
        followers.map {|follower| follower.age.to_f}
    end

    def average_age
        followers_ages.inject {|sum, age| sum += age} / followers.count.to_f
    end

    def my_followers_mottos
        followers.each {|follower| print follower.life_motto + "\n"}
    end

    def self.least_popular
        all.sort_by {|cult| cult.cult_population}.first
    end

    def self.location
        all.map {|cult| cult.location}
    end

    def self.most_common_location
        location.reduce {|popular_location, location| popular_location = location if all.count(location) > all.count(popular_location); popular_location}
    end

    private

    def save
        @@all << self
    end
end