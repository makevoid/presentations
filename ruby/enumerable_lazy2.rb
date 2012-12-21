require 'date'

ETERNITY = Float::INFINITY

p (Date.today..ETERNITY).lazy.select{ |date|
  date.month == 12 && date.day == 1 && date.sunday?
}.take(3).force

# => [#<Date: 2013-12-01 ((2456628j,0s,0n),+0s,2299161j)>, #<Date: 2019-12-01 ((2458819j,0s,0n),+0s,2299161j)>, #<Date: 2024-12-01 ((2460646j,0s,0n),+0s,2299161j)>]

# methods:
# map, flat_map, select, reject, grep, zip, take, take_while, drop, drop_while, cycle

# infos: http://railsware.com/blog/2012/03/13/ruby-2-0-enumerablelazy/