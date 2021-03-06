class A
  def foo
    puts 'original'
  end
end

module B
  def foo
    super
    puts 'from module'
  end
end

class A
  prepend B
end

A.new.foo
#=> original
# from module


# same as Module#include but the ordering is inversed