# frozen_string_literal: true

class NewLineItemComponent < ViewComponent::Base
  include Turbo::FramesHelper
  include Heroicon::ApplicationHelper

  class Props < Dry::Struct
    attribute :date, Dry::Types['date']
  end

  def initialize(*props)
    super
    @props = Props.new(*props)
  end
end
