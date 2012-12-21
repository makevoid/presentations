class Post

  using Titleizer
  prepend Postable

  def post(title: "Default Special Title")
    # ...
    super
  end

end