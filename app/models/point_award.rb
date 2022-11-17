# frozen_string_literal: true

class PointAward < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :event
end
