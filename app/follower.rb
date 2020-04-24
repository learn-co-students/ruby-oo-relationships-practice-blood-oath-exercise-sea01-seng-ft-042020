class Follower

    attr_accessor :life_motto, :age
    attr_reader :name

    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def cults
        BloodOath.all.select{|blood_oath| blood_oath.follower == self }.map{|blood_oath| blood_oath.cult}

    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(self, cult)
            "Follower #{self.name} have been added to cult #{cult.name}"
        else
            "Sorry, follower #{self.name} does not meet the minimum age requirement of #{cult.minimum_age} for cult #{cult.name}."
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select{|follower| follower.age >= age }
    end

    def my_cults_slogans
        BloodOath.all.select{|blood_oath| blood_oath.follower == self}.map{|blood_oath| blood_oath.cult.slogan}
    end

    def self.most_active
        # Note: Unable to  use tally enumerable as its is in Ruby 2.7 and we are on 2.6
        # Group all BloodOaths by follower in a hash
        x = BloodOath.all.group_by{|blood_oath| blood_oath.follower}
        # Map blood_oath object in each key to a count in a hash
        x = x.map{|follower, blood_oath| {follower => blood_oath.count}}
        # Return max follower hash by cult count
        x = x.max_by{|follower_hash| follower_hash.values}
        #Convert single key hash to array, pull first array, and first value which is the follower
        x.to_a.first.first
    end

    def self.top_ten
        # Note: Unable to  use tally enumerable as its is in Ruby 2.7 and we are on 2.6
        # Group all BloodOaths by follower in a hash
        x = BloodOath.all.group_by{|blood_oath| blood_oath.follower}
        # Map blood_oath object in each key to a count in a hash
        x = x.map{|follower, blood_oath| {follower => blood_oath.count}}
        # Sort_by follower_hash by cult count then reverse the order since sort_by does smallest to largetst which is the opposite of what we want.
        x = x.sort_by{|follower_hash| follower_hash.values}.reverse
        # Map the follower_hash to a strin and only bring in the follower which is the first key in the first hash. The slice off the first 10 in the list
        x.map{|follower_hash| follower_hash.to_a.first.first}.slice(0,10)
    end

    def fellow_cult_members
        # Look at my cults, map my cults to a array of each cults_members which is an array.
        x = self.cults.map{|cult| cult.cult_members}
        # Flatten and uniq the members array of arrays, then delete yourself from the list
        x = x.flatten.uniq
        x.delete(self)
        # Return final array of cult members
        x
    end

end