class BloodOath
    attr_reader :cult, :follower, :initiation_date

    @@all = []
    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        save 
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.oath_dates
        all.map {|oath| oath.initiation_date}
    end

    def self.first_oath
        oath_dates.min
    end

end