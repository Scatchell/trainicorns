module Liquid
  class GroundBlock < Liquid::Block
    alias :super_render :render

    def initialize(tag_name, identifier, tokens)
      super
    end

    def render(context)
      context.environments.first["page"]["ground"] = super_render(context)
      ''
    end
  end
end

Liquid::Template.register_tag('ground', Liquid::GroundBlock)
