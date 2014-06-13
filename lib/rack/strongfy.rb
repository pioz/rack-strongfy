require 'nokogiri'

module Rack
  class Strongfy
    include Rack::Utils

    class << self
      attr_accessor :word_list, :selection_class
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      if self.class.word_list.is_a?(Array)
        classes = self.class.selection_class.is_a?(Array) ? self.class.selection_class.map{|x| ".#{x}"}.join(',') : '*'
        body.each do |b|
          doc = Nokogiri::HTML(b)
          self.class.word_list.each do |word|
            doc.css(classes).each do |elem|
              elem.content = elem.content.gsub(/\b(#{word})\b/i, '<strong>\\1</strong>')
            end
          end
          b = doc.to_s
        end
      end
      [status, headers, body]
    end
  end
end
