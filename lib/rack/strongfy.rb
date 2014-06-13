module Rack
  class Strongfy
    include Rack::Utils

    class << self
      attr_accessor :word_list
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      if self.class.word_list.is_a?(Array)
        body.each do |b|
          self.class.word_list.each do |word|
            b.gsub!(/\b(#{word})\b/i, '<strong>\\1</strong>')
          end
        end
      end
      [status, headers, body]
    end
  end
end
