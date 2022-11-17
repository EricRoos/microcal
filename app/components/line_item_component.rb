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

  def line_item
    @props.line_item
  end
end
