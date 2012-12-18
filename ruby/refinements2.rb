module Bar
  refine String do
    def say
      puts self
    end
  end
end

class Foo
  using Bar

  def lol
    "lololol".say
  end
end

Foo.new.lol