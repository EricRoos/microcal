# frozen_string_literal: true

class CalendarController < ApplicationController
  def show
    @dates = ((Date.today - 2.days)..(Date.today + 10.days)).to_a
  end
end
