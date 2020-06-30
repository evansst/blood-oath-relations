class Cult
  attr_accessor :name, :location, :slogan, :minimum_age
  attr_reader :founding_year

  @@all = []

  def initialize name, location, founding_year, slogan
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name name
    @@all.find { |cult| cult.name == name }
  end

  def self.find_by_location location
    @@all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year founding_year
    @@all.select { |cult| cult.founding_year == founding_year }
  end

  def recruit_follower follower, date
    follower.age < @minimum_age ? 'Sorry! You are not old enough to join this cult.' : BloodOath.new(self, follower, date)
  end

  def cult_population
    followers.size
  end

  def average_age
    total = followers.reduce(0) { |sum, follower| sum + follower.age }
    total / cult_population
  end

  def my_followers_mottos
    followers.each { |follower| puts follower.life_motto }
  end

  def self.least_popular
    all.min_by { |cult| cult.cult_population }
  end

  def self.most_popular
    all.max_by { |cult| cult.cult_population }
  end

  def self.most_common_location
    location_frequency = {}
    all.each do |cult|
      location_frequency[cult.location] ? location_frequency[cult.location] += 1 : location_frequency[cult.location] = 1
    end
    location_frequency.max_by { |_location, count| count }.first
  end

  def followers
    blood_oaths = BloodOath.all.select { |oath| oath.cult == self }
    blood_oaths.map(&:follower)
  end
end
