# frozen_string_literal: true

class StaticController < ApplicationController
  skip_before_action :authenticate_user!
  def manifest; end
end
