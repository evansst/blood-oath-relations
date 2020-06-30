class Follower
  attr_accessor :name, :age, :life_motto

  @@all = []

  def initialize name, age, life_motto
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age age
    all.select { |follower| follower.age >= age }
  end

  def cults
    blood_oaths = BloodOath.all.select { |oath| oath.follower == self }
    blood_oaths.map(&:cult)
  end

  def join_cult cult, date
    cult.recruit_follower(self, date)
  end

  def my_cults_slogans
    cults.each { |cult| puts cult.slogan }
  end

  def self.most_active
    all.max_by { |follower| follower.cults.size }
  end

  def self.top_ten
    all.max_by(10) { |follower| follower.cults.size }
  end

  def fellow_cult_members
    fellow_followers = cults.reduce([]) { |followers, cult| followers + cult.followers }.flatten
    fellow_followers.delete(self)
    fellow_followers.uniq
  end
end
