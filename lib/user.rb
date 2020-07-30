class User

    @@all = []



    attr_accessor :name, :locations

    def initialize(name)
        @name = name
        @locations = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        return @@all
    end

    def add(location)
        @locations << location
    end

    def list_locations
        puts "Here is a list of your saved locations:"
        puts "---------------------------------------"
        locations.each_with_index {|location, index|
        puts "#{index + 1}. #{location.name}"}
    end



end
