# frozen_string_literal: true

class LineItemFormComponent < ViewComponent::Base
  include Heroicon::ApplicationHelper

  class Props < Dry::Struct
    attribute :line_item, Dry::Types['any']
  end

  def initialize(line_item:)
    super
    @props = Props.new(line_item:)
  end
end
