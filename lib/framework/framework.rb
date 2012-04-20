include Router, Views

class Framework
  def route(*args)
    Router.route(*args)
  end
  def call(*args)
    Router.call(*args)
  end
end