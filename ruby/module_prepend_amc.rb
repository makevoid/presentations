class A
  def foo
    puts 'foo'
  end
end

class A
  def foo_with_bar
    foo_without_bar
    puts 'foo'
  end
  alias_method_chain :foo, :bar
end

A.new.foo