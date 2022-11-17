# frozen_string_literal: true

class AsideComponent < ViewComponent::Base
  include Heroicon::ApplicationHelper

  class Props < Dry::Struct
    attribute :slide_in, Dry::Types['bool'].default(false)
    attribute :slide_out, Dry::Types['bool'].default(false)
  end

  def initialize(*props)
    super
    @props = Props.new(*props)
  end

  def animated_class
    animation_name = ''
    animation_name = 'slideInUp' if @props.slide_in
    animation_name = 'slideOutDown' if @props.slide_out
    "animate__faster animate__animated animate__#{animation_name}"
  end
end
