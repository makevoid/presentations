require 'date'

ETERNITY = Float::INFINITY

p (Date.today..ETERNITY).lazy.select{ |date|
  date.month == 12 && date.day == 1 && date.sunday?
}.take(10).force

# => ...


# methods:
# map, flat_map, select, reject, grep, zip, take, take_while, drop, drop_while, cycle

# infos: http://railsware.com/blog/2012/03/13/ruby-2-0-enumerablelazy/