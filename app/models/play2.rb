class Shape
  @@name = "shape"
  @inner_name = "unknown"

  class << self
    def funky
      "original"
    end
  end

end

class Triangle
  @inner_name = "triangle"
end

s = Shape.new

class << s
  def foo
    "foo"
  end

  def self.funky
    "special"
  end
end

metaclass =  class << s; self; end

puts metaclass.funky
puts s.class.funky
puts Shape.funky

