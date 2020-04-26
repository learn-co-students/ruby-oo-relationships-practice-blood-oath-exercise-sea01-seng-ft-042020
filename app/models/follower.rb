class Follower
    attr_accessor :age
    attr_reader :name, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        save
    end

    def cults
        self.oaths.map {|oath| oath.cult}
    end

    def join_cult(cult)
        if cult.minimum_age && self.age >= cult.minimum_age
            BloodOath.new(self, cult)
        elsif !cult.minimum_age
            BloodOath.new(self, cult)
        else 
            "You are too young to join this Cult. Thier minimum age is #{cult.minimum_age}"
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        all.select {|follower| follower.age >= age}
    end

    def my_cults_slogan
        self.cults.map {|cult| cult.slogan}
    end

    def self.most_active
        sorted.last
    end

    def self.top_ten
        sorted.last(10)
    end

    def oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def fellow_cult_members
        my_cults_roster.select {|follower| follower != self}
    end

    private

    def my_cults_roster
        cults.map {|cult| cult.followers}.flatten.uniq
    end

    def self.sorted
        all.sort_by {|follower| follower.cults.count}
    end

    def save
        @@all << self
    end
end