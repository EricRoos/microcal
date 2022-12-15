# frozen_string_literal: true

class LineItemComponent < ViewComponent::Base
  include Turbo::FramesHelper
  include Heroicon::ApplicationHelper

  class Props < Dry::Struct
    attribute :line_item, Dry::Types['any']
  end

  def initialize(line_item:)
    super
    @props = Props.new(line_item:)
  end

  def time_color
    time = line_item.time_to_complete_minutes
    return 'transparent' if line_item.completed?

    case time
    when (0..60)
      'bg-gray-300'
    when (61..180)
      'bg-yellow-300'
    else
      'bg-red-500 text-white'
    end
  end

  def line_item
    @props.line_item
  end
end
