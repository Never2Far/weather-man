class User

    @@all = []



    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        return @@all
    end


end
