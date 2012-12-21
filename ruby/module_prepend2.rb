class A
  def foo
    puts 'original'
  end
end

module B
  def foo
    super
    puts 'from module B'
  end
end

module C
  def foo
    super
    puts 'from module C'
  end
end

class A
  prepend B
  prepend C
end

A.new.foo
#=> original
# from module B
# from module C