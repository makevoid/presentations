module Bar
  refine String do
    def say
      puts self
    end
  end

  "lol".say # => prints lol
end

# "lol".say # => undefined method `say' for "lol":String (NoMethodError)