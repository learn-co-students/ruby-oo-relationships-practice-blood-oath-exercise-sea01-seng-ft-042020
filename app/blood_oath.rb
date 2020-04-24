require "date"

class BloodOath
    @@all = []

    def self.all
        @@all
    end

    attr_accessor :cult, :follower
    attr_reader :initiation_date

    def initialize (follower, cult)
        self.cult = cult
        self.follower = follower
        @initiation_date = Date.today.to_s
        self.class.all.push(self)
    end

    def self.first_oath
        self.all.first.follower
    end
end


