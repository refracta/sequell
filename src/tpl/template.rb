require 'tpl/template_parser'
require 'tpl/template_builder'

module Tpl
  class Template
    def self.template_eval(text, provider=nil, &block)
      template(text).eval(provider || block)
    end

    def self.template(text)
      TemplateBuilder.new.apply(TemplateParser.new.parse(text))
    rescue Parslet::ParseFailed
      raise "Invalid template: #{text}"
    end
  end
end
