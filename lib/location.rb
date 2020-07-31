require 'pry'
require 'pp'


class Location

  @@all = []

  attr_accessor :user_input, :name, :lat, :lng, :street, :city, :state, :zip, :county, :country, :neighborhood, :mapUrl

  def initialize(name, attributes)
    @name = name
    @attributes_hash = attributes
    attributes.each {|key, value| self.send(("#{key}="), value)}
    save
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def display_info
    pp @attributes_hash
  end
end