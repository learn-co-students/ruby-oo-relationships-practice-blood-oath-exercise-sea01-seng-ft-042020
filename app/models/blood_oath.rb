class BloodOath
    attr_reader :follower, :cult, :initiation_date
    @@all = []

    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @initiation_date = "#{Time.new.strftime("%Y/%m/%d")}"
        save
        puts "#{follower} has joined #{@cult}!"
    end

    def self.all
        @@all
    end

    def self.first_oath
        all.first.follower
    end

    private

    def save
        @@all << self
    end
end