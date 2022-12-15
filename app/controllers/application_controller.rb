# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_timezone
  include Pundit::Authorization

  def points_enabled?
    false
  end
  helper_method :points_enabled?

  def set_timezone
    sent_timezone = request.headers['X-TimeZone']
    session['timezone'] = sent_timezone if sent_timezone
    Time.zone = session['timezone']
  end
end
