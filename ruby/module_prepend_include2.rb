class A
  def foo
    puts '-> A'
    super
  end
end

module B
  def foo
    puts '-> B'
    super
  end
end

class A
  include B
end

module C
  def foo
    puts '-> C'
    super
  end
end

class A
  include C
end

A.new.foo # =>
# -> A
# -> B
# -> C

# ActionController
# ActiveSupport
# ...