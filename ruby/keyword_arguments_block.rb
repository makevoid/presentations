module A

  define_method(:foo) do |str: "foo", num: 424242|
    [str, num]
  end

end

include A

p A.foo # => ["foo", 424242]