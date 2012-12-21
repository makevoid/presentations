class String
  def titleize
    # ...
  end
end

module Postable
  def post(...)
    # ...
    super
  end
end

class Post < BasePost

  include Postable

  def post(title: "Default Special Title")
    # ...
    super
  end

end