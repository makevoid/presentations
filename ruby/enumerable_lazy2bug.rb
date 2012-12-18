require 'date'

ETERNITY = Float::INFINITY

unless RUBY_VERSION == "2.0.0"
  ETERNITY = 2456265 + 10000

  module Enumerable
    def lazy
      self
    end

    def force
      to_a
    end
  end
end

p (Date.today..ETERNITY).lazy.select{ |date|
  date.month == 12 && date.day == 1 && date.sunday?
}.take(10).force.map{ |date| date.year }

# => ...