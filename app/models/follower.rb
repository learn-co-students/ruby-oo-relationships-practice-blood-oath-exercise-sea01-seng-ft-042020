class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def my_oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def my_cults
        self.my_oaths.map {|oath| oath.cult}
    end

    def join_cult(cult)
        if @age > cult.minimum_age
            BloodOath.new(cult, self, Time.new.strftime("%Y/%m/%d"))
        else
            "Sorry kiddo. You're gonna have to wait until you're old enough to make a big kid decision like this. See ya later."
        end
    end

    def self.of_a_certain_age(age)
        @@all.select {|f| f.age >= age}
    end

    def my_cults_slogans
        self.my_cults.collect {|cult| cult.slogan }
    end

    def self.most_active
        Follower.all.max_by {|follower| follower.my_cults.count}
    end

    def self.top_ten
        top_ten_followers = Follower.all.max_by(10) do |follower| 
            follower.my_cults.count
        end
  
    end 

    def fellow_cult_members

        fellows = my_cults.map {|cult| cult.my_followers}.flatten.uniq
        fellows.reject {|follower| follower == self}
                
    end


end

