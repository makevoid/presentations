def foo(args = {})
  defaults = { a: 1, b: 2 }
  values = defaults.merge args
  puts "a is #{values[:a]}, b is #{values[:b]}"
end

foo(b: 4) # => a is 1, b is 4