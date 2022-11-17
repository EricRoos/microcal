# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :user
  validates :text, length: { minimum: 1 }
end
