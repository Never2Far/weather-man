require 'pry'

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

    def self.intro
        puts "What is your name?"
        username = gets.strip
        new_user = User.new(username)
        puts ""
        puts ""
        puts "Welcome, #{new_user.name}!"
        return new_user
    end

    def add_location(location)
        @locations << location
    end

    def list_locations
        puts "Here is a list of your saved locations:"
        puts "---------------------------------------"
        locations.each_with_index {|location, index|
        puts "#{index + 1}. #{location.name}"}
        puts "---------------------------------------"
    end
end
