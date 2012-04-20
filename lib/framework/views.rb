require 'haml'
require 'tilt'

module Views
  @views_path = File.join(Dir.pwd, 'lib', 'views')

  class << self
    def render_view(name, env)
      if FileTest.exists?(File.join(@views_path, "#{name.underscore}.haml"))
        begin
          controller = Object.const_get(name + "Controller")
        rescue NameError
          controller = nil
        end
        puts name + "Controller"
        puts controller.inspect
        engine = Tilt.new(File.join(@views_path, "#{name.to_s.underscore}.haml"))
        return [200, { 'Content-Type' => 'text/html' }, [engine.render(controller.new(env))]] if controller
        return [200, { 'Content-Type' => 'text/html' }, [engine.render]]
      else
        [404, { 'Content-Type' => 'text/html'}, ["Invalid View #{name}"]]
      end
    end
  end
end