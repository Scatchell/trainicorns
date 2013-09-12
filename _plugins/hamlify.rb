require "haml"

module Jekyll
  module HamlFilter
    def haml(input)
      if input.nil?
        ""
      else
        ::Haml::Engine.new(input).render
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::HamlFilter)
