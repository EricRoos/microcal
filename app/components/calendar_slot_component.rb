# frozen_string_literal: true

class CalendarSlotComponent < ViewComponent::Base
  include Heroicon::ApplicationHelper
  include Turbo::FramesHelper

  class LineItem < Dry::Struct
    attribute :text, Dry::Types['string']
    attribute :completed, Dry::Types['bool']
    attribute :id, Dry::Types['string']
  end

  class Props < Dry::Struct
    attribute :date, Dry::Types['date']
  end

  def initialize(*props)
    super
    @props = Props.new(*props)
  end

  def title
    @props.date.strftime('%m/%d')
  end

  def subtitle
    @props.date.strftime('%a')
  end

  def header_class
    # rubocop:disable Layout/LineLength
    "py-2 font-bold text-lg border-0 border-b-2 border-solid border-black flex justify-between #{Date.today == @props.date ? 'text-blue-500' : ''}"
    # rubocop:enable Layout/LineLength
  end
end
