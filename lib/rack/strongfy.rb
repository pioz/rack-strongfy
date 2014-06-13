require 'nokogiri'

module Rack
  class Strongfy
    include Rack::Utils

    class << self
      attr_accessor :word_list, :selection_classes
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      if headers['Content-Type'].to_s.include?('text/html') && self.class.word_list.is_a?(Array)
        words = self.class.word_list.join('|')
        new_body = []
        classes = self.class.selection_classes.is_a?(Array) ? self.class.selection_classes.map{|x| ".#{x}"}.join(',') : 'body'
        body.each do |b|
          doc = Nokogiri::HTML(b)
          doc.css(classes).each do |elem|
            elem.inner_html = elem.inner_html.gsub(/(\b#{words}\b)(?![^<>]*>|.*?<\/strong>)/i, '<strong>\\1</strong>')
          end
          new_body << doc.to_html
        end
        headers['Content-Length'] &&= bytesize(new_body.join).to_s
        body = new_body
      end
      [status, headers, body]
    end

  end
end
