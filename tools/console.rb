require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

buffs = Cult.new('Colorado Buffalos', 'Boulder', 1876, 'Go Buffs!')
rams = Cult.new('Colorado State Rams', 'Ft. Collins', 1870, 'Sucks to be a CSU Ram')

bills = Cult.new('Buffalo Bills', 'Buffalo', 1959, 'Go Bills!')
patriots = Cult.new('New England Patriots', 'Foxborough', 1959, 'Fuck the Patriots, and Tom Brady')
red_sox = Cult.new('Boston Red Sox', 'Boson', 1901, 'Go Sawx!')

sam = Follower.new('Sam', 30, 'Getting an inch of snow is like winning 10 cents in the lottery.')
tori = Follower.new('Tori', 30, 'I love Tom Brady.')
morgan = Follower.new('Morgan', 30, 'I love Cali, bro')

sam.join_cult bills, '1990/01/30'
tori.join_cult patriots, '1990/05/01'

buffs.recruit_follower sam, '2008/08/20'
buffs.recruit_follower tori, '2008/08/20'
buffs.recruit_follower morgan, '2008/08/20'

sam.join_cult red_sox, '2014/05/22'

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
