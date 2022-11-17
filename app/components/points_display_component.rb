# frozen_string_literal: true

class PointsDisplayComponent < ViewComponent::Base
  class Props < Dry::Struct
    attribute :points, Dry::Types['integer']
    attribute :animated, Dry::Types['bool'].default(false)
  end

  def initialize(*props)
    super
    @props = Props.new(*props)
  end

  def points
    @props.points
  end

  def animated?
    @props.animated
  end
end
