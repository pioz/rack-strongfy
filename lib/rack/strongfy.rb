module Rack
  class Strongfy
    include Rack::Utils

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)

      raise body.inspect

      [status, headers, body]
    end
  end
end
