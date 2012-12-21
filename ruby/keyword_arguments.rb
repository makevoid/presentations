def foo(a: 1, b: 2)
  puts "a -> #{a}, b -> #{b}"
end

foo
# a -> 1, b -> 2

foo a: 3
# a -> 3, b -> 2

foo a: 3, b: 4
# a -> 3, b -> 4