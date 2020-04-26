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
        BloodOath.new(self, cult)
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

    def oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def self.top_ten
        sorted[(sorted.count - 10)...(sorted.count)]
    end

    private

    def self.sorted
        all.sort_by {|follower| follower.cults.count}
    end

    def save
        @@all << self
    end
end